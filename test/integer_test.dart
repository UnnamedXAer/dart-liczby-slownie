import 'dart:math' as math;

import 'package:liczby_slownie/liczby_slownie.dart';
import 'package:liczby_slownie/src/constants.dart';
import 'package:test/test.dart';

import 'test_case.dart';

void main() {
  group('Test Integers', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('positive unites', () {
      var nw = NumberWord();
      for (var i = 1; i < 10; i++) {
        expect(nw.intToWord(i), equals(unitiesArr[i].trim()));
      }
    });

    test('positive teens', () {
      var nw = NumberWord();
      for (var i = 1; i < 10; i++) {
        expect(nw.intToWord(10 + i), equals(teensArr[i].trim()));
      }
    });

    test('positive tens', () {
      var nw = NumberWord();
      for (var i = 1; i < 10; i++) {
        expect(nw.intToWord(i * 10), equals(tensArr[i].trim()));
      }
    });

    test('negative values', () {
      var nw = NumberWord();
      for (int i = 0; i < _nInts.length; i++) {
        expect(nw.intToWord(_nInts[i].given as int), equals(_nInts[i].want),
            reason: _nInts[i].desc);
      }
    });

    test('large numbers', () {
      var nw = NumberWord();
      for (int i = 0; i < _largeNumbers.length; i++) {
        expect(nw.intToWord(_largeNumbers[i].given as int),
            equals(_largeNumbers[i].want),
            reason: _largeNumbers[i].desc);
      }
    });
  });
}

final _nInts = <Test>[
  Test(given: -0, want: 'zero', desc: "zero is zero"),
  Test(given: -1, want: 'minus${unitiesArr[1]}'),
  Test(given: -10, want: 'minus${tensArr[1]}'),
  Test(given: -14, want: 'minus${teensArr[4]}'),
  Test(given: -29, want: 'minus${tensArr[2]}${unitiesArr[9]}'),
  Test(
      given: -329, want: 'minus${hundredsArr[3]}${tensArr[2]}${unitiesArr[9]}'),
  Test(
      given: -4329,
      want:
          'minus${unitiesArr[4]}${rowsOfMagnitude[1][1]}${hundredsArr[3]}${tensArr[2]}${unitiesArr[9]}'),
];

num _p(num power) => math.pow(10, power);

final _largeNumbers = <Test>[
  Test(given: 1234, want: 'jeden tysiąc dwieście trzydzieści cztery'),
  Test(given: 11002, want: 'jedenaście tysięcy dwa'),
  Test(given: 33333, want: 'trzydzieści trzy tysiące trzysta trzydzieści trzy'),
  Test(given: 100 * _p(3), want: 'sto tysięcy'),
  Test(given: 1 * _p(6), want: 'jeden milion'),
  Test(given: 2 * _p(6), want: 'dwa miliony'),
  Test(given: 10 * _p(6), want: 'dziesięć milionów'),
  Test(given: 100 * _p(6), want: 'sto milionów'),
  Test(given: 1 * _p(9), want: 'jeden miliard'),
  Test(given: 2 * _p(9), want: 'dwa miliardy'),
  Test(given: 6 * _p(9), want: 'sześć miliardów'),
  Test(given: 1 * _p(12), want: 'jeden bilion'),
  Test(given: 3 * _p(12), want: 'trzy biliony'),
  Test(given: 5 * _p(12), want: 'pięć bilionów'),
  Test(given: 1 * _p(15), want: 'jeden biliard'),
  Test(given: 3 * _p(15), want: 'trzy biliardy'),
  Test(given: 9 * _p(15), want: 'dziewięć biliardów'),
  Test(given: 1 * _p(18), want: 'jeden trylion'),
  Test(given: 3 * _p(18), want: 'trzy tryliony'),
  Test(given: 9 * _p(18), want: 'dziewięć trylionów'),
  Test(
      given: 222028,
      want: 'dwieście dwadzieścia dwa tysiące dwadzieścia osiem'),
  Test(
      given: 225990,
      want: 'dwieście dwadzieścia pięć tysięcy dziewięćset dziewięćdziesiąt'),
  Test(
      given: 5225982,
      want:
          'pięć milionów dwieście dwadzieścia pięć tysięcy dziewięćset osiemdziesiąt dwa'),
  Test(
      given: 15765971,
      want:
          'piętnaście milionów siedemset sześćdziesiąt pięć tysięcy dziewięćset siedemdziesiąt jeden'),
  Test(
      given: 832765934,
      want:
          'osiemset trzydzieści dwa miliony siedemset sześćdziesiąt pięć tysięcy dziewięćset trzydzieści cztery'),
  Test(
      given: -832765911,
      want:
          'minus osiemset trzydzieści dwa miliony siedemset sześćdziesiąt pięć tysięcy dziewięćset jedenaście'),
];
