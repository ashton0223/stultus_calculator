import 'dart:math';

const ops = ['x', '/', '+', '-'];
const functions = [multiply, divide, add, subtract];

String parseCalculator(String input) {
  try {
    var tokens = input.split(' ');
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < tokens.length; j++) {
        if (tokens[j] == ops[i]) {
          var tokenOne = double.parse(tokens[j - 1]);
          var tokenTwo = double.parse(tokens[j + 1]);
          var combined = functions[i](tokenOne, tokenTwo);
          print(combined);
          tokens[j - 1] = combined.toString();
          for (var k = 0; k < 2; k++) {
            tokens.removeAt(j);
          }
        }
      }
    }
    return tokens[0];
  } catch (e) {
    return input;
  }
}

double multiply(double num1, double num2) {
  return num1 * num2;
}

double divide(double num1, double num2) {
  return num1 / num2;
}

double add(double num1, double num2) {
  return num1 + num2;
}

double subtract(double num1, double num2) {
  return num1 - num2;
}

String randomizeInput(String input) {
  var rng = new Random();
  var tokens = input.split(' ');
  for (var i = 0; i < 4; i++) {
    for (var j = 0; j < tokens.length; j++) {
      if (tokens[j] == ops[i]) {
        tokens[j] = ops[rng.nextInt(4)];
      }
    }
  }
  return tokens.join(' ');
}
