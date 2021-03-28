import 'package:flutter/material.dart';

import 'button.dart';
import 'calculations.dart';

const List<String> buttons = [
  'C',
  '+',
  '-',
  'DEL',
  '7',
  '8',
  '9',
  '/',
  '4',
  '5',
  '6',
  'x',
  '1',
  '2',
  '3',
  '-',
  '0',
  '.',
  '=',
  '+',
];

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _calcView = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(_calcView),
        ),
        Expanded(
          child: GridView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: buttons.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              String b = buttons[index];
              var func;

              // Handling different keys
              if (b == 'C') {
                func = () {
                  setState(() {
                    _calcView = '';
                  });
                };
              } else if (b == 'DEL') {
                func = () {
                  setState(() {
                    String _substr;
                    if (_calcView.length < 1) {
                      _substr = '';
                    } else {
                      _substr = _calcView.substring(
                          _calcView.length - 1, _calcView.length);
                    }
                    if (_substr == " ") {
                      _calcView = _calcView.substring(0, _calcView.length - 3);
                    } else if (_substr != '') {
                      _calcView = _calcView.substring(0, _calcView.length - 1);
                    }
                  });
                };
              } else if (b == '+' || b == '-' || b == 'x' || b == '/') {
                func = () {
                  setState(() {
                    _calcView += ' ' + b + ' ';
                  });
                };
              } else if (b == '=') {
                func = () {
                  setState(() {
                    _calcView = parseCalculator(randomizeInput(_calcView));
                  });
                };
              } else {
                func = () {
                  setState(() {
                    _calcView += b;
                  });
                };
              }

              return CalculatorButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).accentColor,
                text: buttons[index],
                tapped: func,
              );
            },
          ),
        ),
      ],
    );
  }
}
