import 'package:currency_converter/screens/dashboard.dart';
import 'package:currency_converter/shared/currency_list_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyList extends StatefulWidget {

  final String currencyOneShortName;
  final String currencyTwoShortName;
  final bool isCurrencyOne;

  CurrencyList({ this.currencyOneShortName, this.currencyTwoShortName, this.isCurrencyOne });
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40.0,
            onPressed: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => DashboardPage(
                  currencyVal: 0.0,
                  convertedCurrency: 0.0,
                  currenyOne: widget.currencyOneShortName,
                  currencyTwo: widget.currencyTwoShortName,
                  isWhite: !widget.isCurrencyOne,
                )
              ));
            },
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: currencyList.length,
        itemBuilder: (context, index) {
          return _getListItem(currencyList[index]['name'], currencyList[index]['shortName']);
        },
      )
    );
  }

  Widget _getListItem(String newCurrencyName, String newCurrencyShortName) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) => DashboardPage(
            currencyVal: 0.0,
            convertedCurrency: 0.0,
            currenyOne: widget.isCurrencyOne ? newCurrencyShortName: widget.currencyOneShortName,
            currencyTwo: widget.isCurrencyOne ? widget.currencyTwoShortName : newCurrencyShortName,
            isWhite: !widget.isCurrencyOne,
          )
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, top: 20.0),
        child: Text(
          '$newCurrencyName ($newCurrencyShortName)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}