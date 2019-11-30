import 'package:currency_converter/screens/white_input.dart';
import 'package:currency_converter/services/currency.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final double currencyVal;
  final double convertedCurrency;
  final String currenyOne;
  final String currencyTwo;
  final bool isWhite;

  DashboardPage(
      {this.currencyVal,
      this.convertedCurrency,
      this.currenyOne,
      this.currencyTwo,
      this.isWhite});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      CurrencyService().getCurrency(widget.currenyOne),
                      style: TextStyle(color: Colors.white, fontSize: 26.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 120.0,
                      ),
                    ),
                  ),
                  Text(
                    widget.currenyOne,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18.0,
                        letterSpacing: 1.0),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    height: 125.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62.5),
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.red,
                            style: BorderStyle.solid,
                            width: 6.0)),
                    child: Center(
                      child: widget.isWhite
                          ? Icon(
                              Icons.arrow_upward,
                              size: 60,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.arrow_downward,
                              size: 60,
                              color: Colors.red,
                            ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Text(
                    widget.currencyTwo,
                    style: TextStyle(
                        color: Colors.red.withOpacity(0.7),
                        fontSize: 18.0,
                        letterSpacing: 1.0),
                  ),
                  // SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WhiteInputPage(
                          originalCurrency: widget.currenyOne,
                          convertedCurrency: widget.currencyTwo,
                        )
                      ));
                    },
                    child: Text(
                      widget.convertedCurrency.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 120.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      CurrencyService().getCurrency(widget.currencyTwo),
                      style: TextStyle(color: Colors.red, fontSize: 26.0),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
