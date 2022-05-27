import 'dart:math' show pow;

import 'package:liczby_slownie/src/constants.dart';

/// @private
class FloatingPointNumber {
  late final int integer;
  late final int decimal;
  late final int decimalRowMagnitude;

  FloatingPointNumber(this.integer, this.decimal, this.decimalRowMagnitude);

  FloatingPointNumber.fromDouble(double number) {
    integer = number.floor();
    final decimalPartTxt = (number).toString().split('.')[1]; // TODO check number - integer to string
    decimalRowMagnitude = decimalPartTxt.length;
    decimal = int.parse(decimalPartTxt);
    if (number <= 0) {
      integer = -integer;
      decimal = -decimal;
    }
  }

  /// use to deal with prices represented as double to keep decimal part rounded to second place
  FloatingPointNumber.fromPrice(double price) {
    integer = price.floor();
    decimal = ((price - integer) * 100).round();
  }

  double toDouble() {
    final double d = integer.toDouble() + decimal / pow(10, decimalRowMagnitude);
    return d;
  }
}

class NumberWord {
  String translate(num number) {
    switch (number.runtimeType) {
      case int:
        return intToWord(number as int);
      case double:
        return doubleToWord(number as double);

      default:
        throw Exception('use int or double type');
    }
  }

  String translatePrice(num price) {
    switch (price.runtimeType) {
      case int:
        return '${doubleToWord(price / 100)} PLN';
      case double:
        return '${doubleToWord(price as double)} PLN';

      default:
        throw Exception('use int or double type');
    }
  }

  String doubleToWord(double number) {
    if (number == 0) {
      return 'zero';
    }

    final FloatingPointNumber floatingPointNumber =
        FloatingPointNumber.fromDouble(number);

    String out =
        '${_uintToWord(floatingPointNumber.integer)} i ${_uintToWord(floatingPointNumber.decimal, true)}';

    return (number < 0 ? 'minus ' : '') + out;
  }

  String intToWord(int number) {
    if (number == 0) {
      return 'zero';
    }
    return number < 0 ? 'minus ${_uintToWord(-number)}' : _uintToWord(number);
  }

  String _uintToWord(int number, [bool decimalPart = false]) {
    assert(number >= 0, "only non-negative integers");
    if (number == 0) {
      return 'zero';
    }

    final currentRowsOfMagnitude =
        decimalPart ? decimalRowsOfMagnitude : rowsOfMagnitude;

    int integer = number;

    int orderOfMagnitude = 0; //g
    int hundreds = 0; //s
    int teens = 0; // n
    int tens = 0; //d
    int unities = 0; //j
    int grammarForm = 0; // k

    String out = "";

    while (integer != 0) {
      hundreds = ((integer % 1000) / 100).floor();
      tens = ((integer % 100) / 10).floor();
      unities = (integer % 10).floor();

      if (tens == 1 && unities > 0) {
        teens = unities;
        tens = 0;
        unities = 0;
      } else {
        teens = 0;
      }

      if (unities == 1 && hundreds + tens + teens == 0) {
        grammarForm = 0;
      } else if (unities == 2 || unities == 3 || unities == 4) {
        grammarForm = 1;
      } else {
        grammarForm = 2;
      }

      if (hundreds + tens + teens + unities > 0) {
        out = hundredsArr[hundreds] +
            tensArr[tens] +
            teensArr[teens] +
            unitiesArr[unities] +
            currentRowsOfMagnitude[orderOfMagnitude][grammarForm] +
            out;
      }
      orderOfMagnitude++;
      integer = (integer / 1000).floor();
    }

    return out.trim();
  }
}
