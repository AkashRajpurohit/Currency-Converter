import 'package:currency_converter/screens/dashboard.dart';
import 'package:flutter/material.dart';

class CurrencyService {

  // Get full name from currency short version
  String getCurrency(String currency) {
    if(currency == "USD") return "United State Dollar";
    else if(currency == "INR") return "Indian Rupee";
    else if(currency == "RBP") return "Russian Rubble";
    else if(currency == "EUR") return "European Dollar";
    else return currency;
  }

  convertCurrency({
    String fromCurrency, 
    String toCurrency, 
    int amount, 
    BuildContext context
  }) {
    // Hardcode for now. Later bring data from db service and api
    if(fromCurrency == "INR") {
      switch (toCurrency) {
        case "USD":
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashboardPage(
              currencyVal: (amount / 74.3).toStringAsFixed(2),
              convertedCurrency: amount,
              currenyOne: toCurrency,
              currencyTwo: fromCurrency,
              isWhite: true,
            )
          ));
          break;
        default:
      }
    }

    if(fromCurrency == "USD") {
      switch (toCurrency) {
        case "INR":
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashboardPage(
              currencyVal: amount,
              convertedCurrency: (amount * 74.3).toStringAsFixed(2),
              currenyOne: fromCurrency,
              currencyTwo: toCurrency,
              isWhite: false,
            )
          ));
          break;
        default:
      }
    }
  }
}