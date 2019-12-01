import 'package:flutter/material.dart';

Widget numberRow(
    {
      int number1, 
      int number2, 
      int number3,
      int currentInputValue,
      Color color1, 
      Color color2,
      Function updateCurrentInput
    }) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: color1.withOpacity(0.6),
        ),
        child: InkWell(
          onTap: () {
            _calculateNumber(number1, currentInputValue, updateCurrentInput);
          },
          borderRadius: BorderRadius.circular(40.0),
          splashColor: color1,
          hoverColor: color1,
          focusColor: color1,
          highlightColor: color1,
          child: Center(
            child: Text(
              number1.toString(),
              style: TextStyle(
                  color: color2, fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
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
            _calculateNumber(number2, currentInputValue, updateCurrentInput);
          },
          borderRadius: BorderRadius.circular(40.0),
          splashColor: color1,
          hoverColor: color1,
          focusColor: color1,
          highlightColor: color1,
          child: Center(
            child: Text(
              number2.toString(),
              style: TextStyle(
                  color: color2, fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
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
            _calculateNumber(number3, currentInputValue, updateCurrentInput);
          },
          borderRadius: BorderRadius.circular(40.0),
          splashColor: color1,
          hoverColor: color1,
          focusColor: color1,
          highlightColor: color1,
          child: Center(
            child: Text(
              number3.toString(),
              style: TextStyle(
                  color: color2, fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ],
  );
}

_calculateNumber(int number, int currentInputValue, Function updateCurrentInput) {
  if(currentInputValue < 100000000) {
    if(currentInputValue == 0) {
      updateCurrentInput(number);
    } else {
      updateCurrentInput((currentInputValue * 10) + number);
    }
  }
}
