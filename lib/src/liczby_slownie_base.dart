import 'dart:math' show pow;

import 'package:liczby_slownie/src/constants.dart';

/// @private
class FloatingPointNumber {
  late final int integer;
  late final int decimal;
  late final int decimalRowMagnitude;
  late final bool isNegative;

  FloatingPointNumber(this.integer, this.decimal, this.decimalRowMagnitude,
      [this.isNegative = false]);

  FloatingPointNumber.fromDouble(double number, [bool? isNegative]) {
    this.isNegative = isNegative ?? number < 0;
    integer = (number < 0 ? number * -1 : number).floor();
    final decimalPartTxt = (number)
        .toString()
        .split('.')[1]; // TODO check number - integer to string
    decimalRowMagnitude = decimalPartTxt.length;
    decimal = int.parse(decimalPartTxt);
  }

  /// use to deal with prices represented as double to keep decimal part rounded to second place
  FloatingPointNumber.fromPrice(double price, [bool? isNegative]) {
    this.isNegative = isNegative ?? price < 0;
    final positivePrice = (price < 0 ? -price : price);
    integer = positivePrice.floor();
    decimalRowMagnitude = 2;
    decimal = ((positivePrice - integer) * 100).round();
  }

  double toDouble() {
    double d = integer.toDouble() + decimal / pow(10, decimalRowMagnitude);
    if (isNegative) {
      d *= -1;
    }
    return d;
  }
}

class NumberWord {
  /// int only
  String translate(int number) {
    return intToWord(number);
  }

  // isNegative - see below
  String translatePrice(num price, [int? decimalPart, bool? isNegative]) {
    assert(
      !(price < 0 && isNegative == false),
      'setting isNegative to true will override price mark',
    );

    late final FloatingPointNumber priceRepresentation;
    switch (price.runtimeType) {
      case int:
        decimalPart ??= 0;
        assert(decimalPart >= 0 && decimalPart <= 99,
            'decimal part of money must be 0-99 inclusive');
        if (decimalPart < 0) {
          decimalPart *= -1;
        }
        if (decimalPart > 99) {
          decimalPart = int.parse(decimalPart.toString().substring(0, 2));
        }
        priceRepresentation = FloatingPointNumber(
          price as int,
          decimalPart,
          2,
          // to handle values like price = -0 and decimalPart > 0, eg. -0.69
          // in that case price would be interpreted as not-negative
          (isNegative == true && (price != 0 || decimalPart > 0)) ||
              (price < 0),
        );
        break;
      case double:
        assert(decimalPart == null,
            "when `price` is of type double `decimalPart` must be null");
        priceRepresentation =
            FloatingPointNumber.fromPrice(price as double, isNegative);
        break;
      default:
        throw Exception('use int or double type');
    }

    return _translateDoublePrice(priceRepresentation);
  }

  String _translateDoublePrice(FloatingPointNumber price) {
    final integerUnitName =
        _selectUnitName(price.integer, ['złoty', 'złote', 'złotych']);

    final decimalUnitName =
        _selectUnitName(price.decimal, ['grosz', 'grosze', 'groszy']);

    return '${price.isNegative ? 'minus ' : ''}${_uintToWord(price.integer)} $integerUnitName, ${_uintToWord(price.decimal)} $decimalUnitName';
  }

  static String _selectUnitName(int number, List<String> names) {
    int n = number % 10;

    if (number == 1) {
      return names[0];
    }

    if (n >= 2 && n <= 4 && (number < 11 || number > 21)) {
      return names[1];
    }

    return names[2];
  }

  String intToWord(int number) {
    if (number == 0) {
      return 'zero';
    }
    return number < 0 ? 'minus ${_uintToWord(-number)}' : _uintToWord(number);
  }

  String _uintToWord(int number) {
    assert(number >= 0, "only non-negative integers");
    if (number == 0) {
      return 'zero';
    }

    final currentRowsOfMagnitude = rowsOfMagnitude;

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
