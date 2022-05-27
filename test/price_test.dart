import 'dart:math' as math;

import 'package:liczby_slownie/liczby_slownie.dart';
import 'package:liczby_slownie/src/constants.dart';
import 'package:test/test.dart';

import 'test_case.dart';

void main() {
  group('Test floating point numbers', () {
    test('prices', () {
      var nw = NumberWord();
      for (int i = 0; i < _tests.length; i++) {
        expect(nw.translatePrice(_tests[i].given), equals(_tests[i].want),
            reason: _tests[i].desc);
      }
    });
  });
}

final _tests = <Test>[
  Test(given: 0.00, want: 'zero złotych'),
  Test(given: 1.00, want: 'jeden złoty'),
  Test(given: 2.00, want: 'dwa złote'),
  Test(given: 5.00, want: 'pięć złotych'),
  Test(given: 12.00, want: 'dwanaście złotych'),
  Test(given: 20.00, want: 'dwadzieścia jeden złotych'),
  Test(given: 22.00, want: 'dwadzieścia dwa złote'),
  Test(given: 22, want: 'dwadzieścia dwa złote'),
  Test(given: 0.1, want: 'zero złotych i dziesięć groszy'),
  Test(given: 0.10, want: 'zero złotych i dziesięć groszy'),
  Test(given: 0.3, want: 'zero złotych i trzydzieści groszy'),
  Test(given: 0.7, want: 'zero i siedemdziesiąt groszy'),
];
