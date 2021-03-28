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
  double _sizeMultiplier = 1;
  bool _equalFlag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              _calcView,
              textAlign: TextAlign.right,
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 1.5 * _sizeMultiplier),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 520,
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
                      _equalFlag = false;
                    });
                  };
                } else if (b == 'DEL') {
                  func = () {
                    setState(() {
                      _equalFlag = false;
                      String _substr;
                      if (_calcView.length < 1) {
                        _substr = '';
                      } else {
                        _substr = _calcView.substring(
                            _calcView.length - 1, _calcView.length);
                      }
                      if (_substr == " ") {
                        _calcView =
                            _calcView.substring(0, _calcView.length - 3);
                      } else if (_substr != '') {
                        _calcView =
                            _calcView.substring(0, _calcView.length - 1);
                      }
                    });
                  };
                } else if (b == '=') {
                  func = () {
                    setState(() {
                      _calcView = parseCalculator(randomizeInput(_calcView));
                      _equalFlag = true;
                    });
                  };
                } else if (b == '+' || b == '-' || b == 'x' || b == '/') {
                  func = () {
                    setState(() {
                      _equalFlag = false;
                      _calcView += ' ' + b + ' ';
                    });
                  };
                } else {
                  func = () {
                    setState(() {
                      if (_equalFlag) {
                        _calcView = b;
                      } else {
                        _calcView += b;
                      }
                      _equalFlag = false;
                    });
                  };
                }

                // Change size multiplier in case there are too many #s
                if (_calcView.length > 12) {
                  _sizeMultiplier = 10 / (_calcView.length - 3);
                } else {
                  _sizeMultiplier = 1;
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
        ),
      ],
    );
  }
}
