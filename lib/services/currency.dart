import 'dart:convert';
import 'dart:io';

import 'package:currency_converter/screens/dashboard.dart';
import 'package:currency_converter/shared/currency_list_names.dart';
import 'package:currency_converter/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyService {
  // Get full name from currency short version
  String getCurrency(String currencyName) {
    for (Map currency in currencyList) {
      if (currency['shortName'] == currencyName) {
        return currency['name'];
      }
    }
    return '';
  }

  convertCurrency(
      {String fromCurrency,
      String toCurrency,
      int amount,
      bool isWhite,
      BuildContext context}) async {
    Map<String, dynamic> rates = await getConvertedCurrencyAmount(fromCurrency);

    if (rates.isNotEmpty) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(
                currencyVal: isWhite
                    ? (amount * rates[toCurrency] ?? 0).toStringAsFixed(2)
                    : amount,
                convertedCurrency: isWhite
                    ? amount
                    : (amount * rates[toCurrency] ?? 0).toStringAsFixed(2),
                currenyOne: isWhite ? toCurrency : fromCurrency,
                currencyTwo: isWhite ? fromCurrency : toCurrency,
                isWhite: isWhite,
              )));
    }
  }

  Future<Map<String, dynamic>> getConvertedCurrencyAmount(
      String fromCurrency) async {
    String baseURL = "https://api.exchangerate-api.com/v4/latest/";

    try {
      Map rates = await getCache(fromCurrency);

      if (rates != null) {
        return rates;
      }

      ToastMessage(
              message: "Please wait while we load today's conversion rates.")
          .showMessage();

      Response response = await get('$baseURL/$fromCurrency');

      Map data = json.decode(response.body);

      await storeCache(fromCurrency, data['rates']);

      return data['rates'];
    } on SocketException {
      ToastMessage(message: "Please have an active internet connection.")
          .showMessage();
      return {};
    } catch (e) {
      ToastMessage(message: "Something went wrong. Please try again later")
          .showMessage();
      return {};
    }
  }

  // Caching Data
  Future storeCache(String currency, Map<String, dynamic> rates) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> cachedData = {
      'rates': rates,
      'expiry': new DateTime.now().toString()
    };

    prefs.setString(currency, json.encode(cachedData));
  }

  Future<Map<String, dynamic>> getCache(String currency) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      String cachedData = prefs.getString(currency);

      if (cachedData == null) {
        return null;
      }

      Map cache = json.decode(cachedData);

      DateTime now = new DateTime.now();
      DateTime expiry = DateTime.parse(cache['expiry']);
      Duration difference = now.difference(expiry);

      if (difference.inDays > 1) {
        // Cache expired. Return null
        return null;
      } else {
        return cache['rates'];
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
