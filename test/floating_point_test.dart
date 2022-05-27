import 'package:liczby_slownie/liczby_slownie.dart';
import 'package:test/test.dart';

void main() {
  group('Test floating point numbers', () {
    test('x.x.1', () {
      final double d = 2.1;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 1, 1);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.1', () {
      final double d = 2.90;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 9, 1);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.1', () {
      final double d = 2.900;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 9, 1);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.2', () {
      final double d = 2.01;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 1, 2);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.2', () {
      final double d = 2.99;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 99, 2);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.2', () {
      final double d = 2.040;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 4, 2);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.3', () {
      final double d = 2.001;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 1, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.3', () {
      final double d = 2.0080;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 8, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.3', () {
      final double d = 2.011;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 11, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.3', () {
      final double d = 2.111;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 111, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('x.x.6', () {
      final d = 2.900001;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 900001, 6);
      expect(_compareFPN(d, got, want), isTrue,
          reason: 'got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
  });
}

bool _compareFPN(double given, FloatingPointNumber a, FloatingPointNumber b) {
  return a.toDouble() == given && a.toDouble() == b.toDouble();
  return a.integer == b.integer &&
      a.decimal == b.decimal &&
      a.decimalRowMagnitude == a.decimalRowMagnitude;
}
