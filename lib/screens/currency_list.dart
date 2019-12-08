import 'package:currency_converter/screens/about.dart';
import 'package:currency_converter/screens/dashboard.dart';
import 'package:currency_converter/shared/currency_list_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyList extends StatefulWidget {

  final String currencyOneShortName;
  final String currencyTwoShortName;
  final bool isWhite;

  CurrencyList({ this.currencyOneShortName, this.currencyTwoShortName, this.isWhite });
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {

  TextEditingController _editingController = new TextEditingController();
  String filter = "";

  @override
  void initState() {
    super.initState();
    _editingController.addListener(() {
      setState(() {
        filter = _editingController.value.text;
      });
    });
  }

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
                  isWhite: widget.isWhite,
                )
              ));
            },
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AboutPage()
                ));
              },
              icon: Icon(Icons.error_outline),
              iconSize: 35.0,
              color: Colors.white
            )
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(
                color: Colors.white
              ),
              cursorColor: Colors.white12,
              decoration: InputDecoration(
                hasFloatingPlaceholder: true,
                alignLabelWithHint: true,
                labelText: 'Search',
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                hintText: 'Type currency name or short code',
                hintStyle: TextStyle(
                  color: Colors.white54
                ),
                prefixIcon: Icon(Icons.search),
                prefixStyle: TextStyle(
                  color: Colors.white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white60,
                    width: 2.0
                  )
                )
              ),
              controller: _editingController,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currencyList.length,
              itemBuilder: (BuildContext context, int index) {
                return filter == null || filter == "" 
                  ? _getListItem(currencyList[index]['name'], currencyList[index]['shortName'])
                  : currencyList[index]['name'].toLowerCase().contains(filter.toLowerCase()) || currencyList[index]['shortName'].toLowerCase().contains(filter.toLowerCase())
                    ? _getListItem(currencyList[index]['name'], currencyList[index]['shortName'])
                    : Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getListItem(String newCurrencyName, String newCurrencyShortName) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) => DashboardPage(
            currencyVal: 0.0,
            convertedCurrency: 0.0,
            currenyOne: widget.isWhite ? widget.currencyOneShortName : newCurrencyShortName ,
            currencyTwo: widget.isWhite ? newCurrencyShortName : widget.currencyTwoShortName,
            isWhite: widget.isWhite,
          )
        ));
      },
      splashColor: Colors.red,
      hoverColor: Colors.red,
      highlightColor: Colors.red,
      focusColor: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0 ),
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