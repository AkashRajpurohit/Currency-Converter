import 'package:currency_converter/screens/currency_list.dart';
import 'package:currency_converter/screens/red_input.dart';
import 'package:currency_converter/screens/white_input.dart';
import 'package:currency_converter/services/currency.dart';
import 'package:currency_converter/shared/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final dynamic currencyVal;
  final dynamic convertedCurrency;
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

    double _fontSize = 120.0;

    if(widget.currencyVal.toString().length > widget.convertedCurrency.toString().length) {
      _fontSize = getFontSize(widget.currencyVal.toString());
    } else {
      _fontSize = getFontSize(widget.convertedCurrency.toString());
    }

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
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => CurrencyList(
                            currencyOneShortName: widget.currenyOne,
                            currencyTwoShortName: widget.currencyTwo,
                            isWhite: false
                          )
                        ));
                      },
                      child: Text(
                        CurrencyService().getCurrency(widget.currenyOne),
                        style: TextStyle(color: Colors.white, fontSize: 26.0),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => RedInputPage(
                                originalCurrency: widget.currenyOne,
                                convertedCurrency: widget.currencyTwo)));
                      },
                      child: Text(
                        widget.currencyVal.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _fontSize,
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
                    Text(
                      widget.currencyTwo,
                      style: TextStyle(
                          color: Colors.red.withOpacity(0.7),
                          fontSize: 18.0,
                          letterSpacing: 1.0),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => WhiteInputPage(
                                originalCurrency: widget.currenyOne,
                                convertedCurrency: widget.currencyTwo)));
                      },
                      child: Text(
                        widget.convertedCurrency.toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: _fontSize,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => CurrencyList(
                            currencyOneShortName: widget.currenyOne,
                            currencyTwoShortName: widget.currencyTwo,
                            isWhite: true
                          )
                        ));
                      },
                      child: Text(
                        CurrencyService().getCurrency(widget.currencyTwo),
                        style: TextStyle(color: Colors.red, fontSize: 26.0),
                      ),
                    ),
                    Row(
                    	mainAxisAlignment: MainAxisAlignment.center,
                    	children: <Widget>[
                    		Text(
                    			"Made in ",
                    			style: TextStyle(
                    				color: Colors.red,
                    				fontSize: 14.0
                    			)
                    		),
                    		Image(
                    			image: AssetImage('assets/india_flag.png'),
                    			width: 20.0,
                    			height: 20.0
                    		)
                    	]
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
