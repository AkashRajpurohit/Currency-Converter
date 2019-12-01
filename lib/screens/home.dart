import 'package:currency_converter/services/currency.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    CurrencyService().convertCurrency(
      fromCurrency: 'USD',
      toCurrency: 'INR',
      amount: 1,
      context: context,
      isWhite: false
    );

    return Scaffold(
      backgroundColor: Colors.red[700],
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/icon.png'),
          radius: 75.0,
        ),
      ),
    );
  }
}