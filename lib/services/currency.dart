import 'dart:convert';

import 'package:currency_converter/screens/dashboard.dart';
import 'package:currency_converter/shared/currency_list_names.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DashboardPage(
              currencyVal: isWhite
                  ? (amount * rates[toCurrency]).toStringAsFixed(2)
                  : amount,
              convertedCurrency: isWhite
                  ? amount
                  : (amount * rates[toCurrency]).toStringAsFixed(2),
              currenyOne: isWhite ? toCurrency : fromCurrency,
              currencyTwo: isWhite ? fromCurrency : toCurrency,
              isWhite: isWhite,
            )));
  }

  Future<Map<String, dynamic>> getConvertedCurrencyAmount(
      String fromCurrency) async {
    String baseURL = "https://api.exchangerate-api.com/v4/latest/";

    Response response = await get('$baseURL/$fromCurrency');

    Map data = json.decode(response.body);

    return data['rates'] ?? {};
  }
}
