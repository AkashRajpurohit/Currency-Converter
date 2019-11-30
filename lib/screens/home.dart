import 'package:currency_converter/screens/dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage(currenyOne: 'USD', currencyTwo: 'INR', currencyVal: 1.00, convertedCurrency: 74.32, isWhite: false);
  }
}