import 'package:currency_converter/shared/final_row.dart';
import 'package:currency_converter/shared/font_size.dart';
import 'package:currency_converter/shared/number_row.dart';
import 'package:flutter/material.dart';

class RedInputPage extends StatefulWidget {

  final String originalCurrency; //USD
  final String convertedCurrency; //INR

  RedInputPage({ this.originalCurrency, this.convertedCurrency });

  @override
  _RedInputPageState createState() => _RedInputPageState();
}

class _RedInputPageState extends State<RedInputPage> {

  void updateCurrentInput(value) => setState(() => currentInput = value);

  int currentInput = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: Column(
        children: <Widget>[
          SizedBox(height: 45.0),
          InkWell(
            onTap: () {
              setState(() => currentInput = 0);
            },
            child: Text(
              'Tap to delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              currentInput.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: getFontSize(currentInput.toString()),
                fontWeight: FontWeight.bold
              )
            ),
          ),
          SizedBox(height: 25.0),
          numberRow(
            number1: 1, 
            number2: 2, 
            number3: 3, 
            color1: Colors.red, 
            color2: Colors.white,
            updateCurrentInput: updateCurrentInput,
            currentInputValue: currentInput
          ),
          SizedBox(height: 25.0),
          numberRow(
            number1: 4, 
            number2: 5, 
            number3: 6, 
            color1: Colors.red, 
            color2: Colors.white,
            updateCurrentInput: updateCurrentInput,
            currentInputValue: currentInput
          ),
          SizedBox(height: 25.0),
          numberRow(
            number1: 7, 
            number2: 8, 
            number3: 9, 
            color1: Colors.red, 
            color2: Colors.white,
            updateCurrentInput: updateCurrentInput,
            currentInputValue: currentInput
          ),
          SizedBox(height: 25.0),
          finalRow(
            color1: Colors.red,
            color2: Colors.white,
            updateCurrentInput: updateCurrentInput,
            currentInputValue: currentInput,
            context: context,
            fromCurrency: widget.originalCurrency,
            toCurrency: widget.convertedCurrency
          )
        ],
      ),
    );
  }
}