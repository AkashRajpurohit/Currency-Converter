import 'package:flutter/material.dart';

Widget finalRow(
    {
      int currentInputValue,
      Color color1, 
      Color color2,
      Function updateCurrentInput,
      BuildContext context
    }) {
  return Row(
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
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(40.0),
          splashColor: color1,
          hoverColor: color1,
          focusColor: color1,
          highlightColor: color1,
          child: Center(
            child: Icon(
              Icons.arrow_drop_down,
              color: color2,
              size: 60.0
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
          color: color1,
        ),
        child: InkWell(
          onTap: () {
            
          },
          borderRadius: BorderRadius.circular(40.0),
          splashColor: color1,
          hoverColor: color1,
          focusColor: color1,
          highlightColor: color1,
          child: Center(
            child: Icon(
              Icons.check,
              color: color2,
              size: 25.0
            ),
          ),
        ),
      ),
    ],
  );
}

_calculateNumber(int number, int currentInputValue, Function updateCurrentInput) {
  if(currentInputValue == 0) {
    updateCurrentInput(number);
  } else {
    updateCurrentInput((currentInputValue * 10) + number);
  }
}
