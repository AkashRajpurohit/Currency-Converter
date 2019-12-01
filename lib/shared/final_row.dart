import 'package:currency_converter/services/currency.dart';
import 'package:flutter/material.dart';

Widget finalRow({
  int currentInputValue,
  Color color1,
  Color color2,
  Function updateCurrentInput,
  BuildContext context,
  String fromCurrency,
  String toCurrency,
}) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: color1,
            ),
            child: InkWell(
              onTap: () {
                // Restart from 0
                _removeLastOne(currentInputValue, updateCurrentInput);
              },
              borderRadius: BorderRadius.circular(40.0),
              splashColor: color1,
              hoverColor: color1,
              focusColor: color1,
              highlightColor: color1,
              child: Center(
                child: Icon(Icons.arrow_left, color: color2, size: 60.0),
              ),
            ),
          ),
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: color1.withOpacity(0.6),
            ),
            child: InkWell(
              onTap: () {
                _calculateNumber(0, currentInputValue, updateCurrentInput);
              },
              borderRadius: BorderRadius.circular(40.0),
              splashColor: color1,
              hoverColor: color1,
              focusColor: color1,
              highlightColor: color1,
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(
                      color: color2,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: color1,
            ),
            child: InkWell(
              onTap: () {
                CurrencyService().convertCurrency(
                    fromCurrency: fromCurrency,
                    toCurrency: toCurrency,
                    amount: currentInputValue,
                    context: context);
              },
              borderRadius: BorderRadius.circular(40.0),
              splashColor: color1,
              hoverColor: color1,
              focusColor: color1,
              highlightColor: color1,
              child: Center(
                child: Icon(Icons.check, color: color2, size: 25.0),
              ),
            ),
          ),
        ],
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Center(
            child: InkWell(
              onTap: () {
                CurrencyService().convertCurrency(
                    fromCurrency: fromCurrency,
                    toCurrency: toCurrency,
                    amount: 0,
                    context: context);
              },
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: color1.withOpacity(0.7),
                size: 60.0,
              ),
            ),
          ),
        ),
      )
    ],
  );
}

void _calculateNumber(
    int number, int currentInputValue, Function updateCurrentInput) {
  if (currentInputValue < 100000000) {
    if (currentInputValue == 0) {
      updateCurrentInput(number);
    } else {
      updateCurrentInput((currentInputValue * 10) + number);
    }
  }
}

void _removeLastOne(int currentInputValue, Function updateCurrentInput) {
  String valueString = currentInputValue.toString();
  if (valueString.length == 1) {
    updateCurrentInput(0);
  } else {
    int updatedValue =
        int.parse(valueString.substring(0, valueString.length - 1));
    updateCurrentInput(updatedValue);
  }
}
