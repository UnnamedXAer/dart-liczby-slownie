import 'package:liczby_slownie/src/liczby_slownie_base.dart' show FloatingPointNumber;
import 'package:test/test.dart';

void main() {
  group('Test floating point numbers toDouble', () {
    test('1. x.x.1', () {
      final double want = 0.0;
      final got = FloatingPointNumber(0, 0, 1);
      expect(got.toDouble(), want);
    });
    test('2. x.x.1', () {
      final double want = 2.90;
      final got = FloatingPointNumber(2, 9, 1);
      expect(got.toDouble(), want);
    });
    test('3. negative x.x.1', () {
      final double want = -2.90;
      final got = FloatingPointNumber(2, 9, 1, true);
      expect(got.toDouble(), want);
    });
    test('4. negative x.x.1', () {
      final double want = -2;
      final got = FloatingPointNumber(2, 0, 1, true);
      expect(got.toDouble(), want);
    });
    test('5. x.x.3', () {
      final double want = 32322.001;
      final got = FloatingPointNumber(32322, 1, 3, false);
      expect(got.toDouble(), want);
    });
    test('6. negative x.x.3', () {
      final double want = -2.001;
      final got = FloatingPointNumber(2, 1, 3, true);
      expect(got.toDouble(), want);
    });
  });

  group('Test floating point numbers from double', () {
    test('1. x.x.1', () {
      final double d = 0.0;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(0, 0, 1);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('2. x.x.1', () {
      final double d = -0.0;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(0, 0, 1);
      expect(_compareFPN(d, got, want), isTrue, reason: 'zero is zero');
    });
    test('3. x.x.1', () {
      final double d = 2.1;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 1, 1);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('4. x.x.1', () {
      final double d = 2.90;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 9, 1);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('5. x.x.1', () {
      final double d = 2.900;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 9, 1);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('1. x.x.2', () {
      final double d = 2.01;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 1, 2);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('2. x.x.2', () {
      final double d = 2.99;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 99, 2);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('3. x.x.2', () {
      final double d = 2.040;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 4, 2);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('1. x.x.3', () {
      final double d = 2.001;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 1, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('2. x.x.3', () {
      final double d = 2.0080;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 8, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('3. x.x.3', () {
      final double d = 2.011;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 11, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('4. x.x.3', () {
      final double d = 2.111;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 111, 3);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('1. x.x.6', () {
      final d = 2.900001;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 900001, 6);
      expect(_compareFPN(d, got, want), isTrue,
          reason: 'got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
    test('A. -x.x.1', () {
      final d = -2.900001;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 900001, 6, true);
      expect(_compareFPN(d, got, want), isTrue,
          reason:
              'number: $d: got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
    test('B. -x.x.6', () {
      final d = -2.1;
      final got = FloatingPointNumber.fromDouble(d);
      final want = FloatingPointNumber(2, 1, 1, true);
      expect(_compareFPN(d, got, want), isTrue,
          reason: 'got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
  });

  group('Test floating point numbers from double negative', () {
    test('1. negative x.x.3', () {
      final double d = 2.111;
      final got = FloatingPointNumber.fromDouble(d, true);
      final want = FloatingPointNumber(2, 111, 3, true);
      expect(_compareFPN(-2.111, got, want), isTrue);
    });
    test('2. negative -x.x.3', () {
      final double d = -2.111;
      final got = FloatingPointNumber.fromDouble(d, true);
      final want = FloatingPointNumber(2, 111, 3, true);
      expect(_compareFPN(d, got, want), isTrue);
    });
    test('3. negative x.x.3', () {
      final double d = -2.111;
      final got = FloatingPointNumber.fromDouble(
        d,
        false, // it will override mark od the `d` value;
      );
      final want = FloatingPointNumber(2, 111, 3, false);
      expect(_compareFPN(2.111, got, want), isTrue);
    });
    test('4. negative x.x.6', () {
      final d = -2.900001;
      final got = FloatingPointNumber.fromDouble(d, true);
      final want = FloatingPointNumber(2, 900001, 6, true);
      expect(_compareFPN(d, got, want), isTrue,
          reason: 'got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
    test('5. negative x.x.6', () {
      final d = -2.900001;
      final got = FloatingPointNumber.fromDouble(d, false);
      final want = FloatingPointNumber(2, 900001, 6, false);
      expect(_compareFPN(2.900001, got, want), isTrue,
          reason: 'got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
  });
  int c = 0;
  group('Test floating point numbers from price', () {
    test((++c).toString(), () {
      final p = 9.99;
      final got = FloatingPointNumber.fromPrice(p);
      final want = FloatingPointNumber(9, 99, 2, false);
      expect(_compareFPN(p, got, want), isTrue,
          reason: 'got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
    test((++c).toString(), () {
      final p = 09.99;
      final got = FloatingPointNumber.fromPrice(p);
      final want = FloatingPointNumber(9, 99, 2, false);
      expect(_compareFPN(p, got, want), isTrue,
          reason: 'got: ${got.toDouble()}, want: ${want.toDouble()}');
    });
    test((++c).toString(), () {
      final p = 0.001;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 0.0;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 0.004;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 0.0;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 0.005;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 0.01;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 0.009;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 0.01;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 4.039;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 4.04;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 4.8851;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 4.89;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 4.89909;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 4.90;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = -4.9954555;
      final got = FloatingPointNumber.fromPrice(p);
      final want = -5.0;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = -0.997;
      final got = FloatingPointNumber.fromPrice(p, false);
      final want = 1.0;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 99.997;
      final got = FloatingPointNumber.fromPrice(p, true);
      final want = -100.0;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 13299.99333333333333;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 13299.99;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 13299.6666666666;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 13299.67;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 13299.6636666666;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 13299.66;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 9999.47;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 9999.47;
      expect(got.toDouble(), want);
    });
    test((++c).toString(), () {
      final p = 76542.45637456784585678563345634;
      final got = FloatingPointNumber.fromPrice(p);
      final want = 76542.46;
      expect(got.toDouble(), want);
    });
  });
}

bool _compareFPN(double given, FloatingPointNumber a, FloatingPointNumber b) {
  return a.toDouble() == given && a.toDouble() == b.toDouble();
}
