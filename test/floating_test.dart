import 'dart:math' as math;

import 'package:liczby_slownie/liczby_slownie.dart';
import 'package:liczby_slownie/src/constants.dart';
import 'package:test/test.dart';

import 'test_case.dart';

void main() {
  group('test floating point numbers', () {
    for (var tC in _tests) {
      test(tC.desc, () {
        final cases = tC.cases;
        var nw = NumberWord();
        for (int i = 0; i < cases.length; i++) {
          expect(nw.translate(cases[i].given), equals(cases[i].want),
              reason: cases[i].desc ?? cases[i].given.toString());
        }
      });
    }
  });
}

final List<TestCase> _tests = [
  // TestCase(
  //   desc: '(1,1)',
  //   cases: <Test>[
  //     Test(given: 0.00, want: 'zero'),
  //     Test(given: 0.1, want: 'jedna dziesietna'),
  //     Test(given: 0.10, want: 'siedem dziesietnych'),
  //     Test(given: 0.3, want: 'trzy dziesietne'),
  //     Test(given: 0.7, want: 'siedem dziesietnych'),
  //     Test(given: 0.01, want: 'jedna setna'),
  //     Test(given: 0.02, want: 'dwie setne'),
  //     Test(given: 0.08, want: 'osiem setnych'),
  //     Test(given: 0.11, want: 'jedenaście setnych'),
  //     Test(given: 0.38, want: 'trzydzieści osiem setnych'),
  //     Test(given: -0.00, want: 'zero', desc: 'zero is zero'),
  //     Test(given: -0.7, want: 'minus siedem dziesietnych'),
  //   ],
  // ),
  TestCase(
    desc: '(-∞,-1] ∪ [1,∞)',
    cases: <Test>[
      // Test(given: 1, want: 'jeden'),
      // Test(given: 1.25, want: 'jeden i dwadzieścia pięć setnych'),
      Test(given: 2.001, want: 'dwa i jedna tysięczna'),
      // Test(given: 2.002, want: 'dwa i dwie tysięczne'),
      // Test(given: 2.005, want: 'dwa i dwie tysięcznych'),
      // Test(given: 2.015, want: 'dwa i piętnaście tysięcznych'),
      // Test(given: 2.432, want: 'dwa i czterysta trzydziesci dwie tysięczne'),
      // Test(given: 2.435, want: 'dwa i czterysta trzydziesci pięć tysięcznych'),
      // Test(given: 2.0001, want: 'dwa i jedna dziesięciotysięczna'),
      // Test(given: 2.0002, want: 'dwa i dwie dziesięciotysięczne'),
      // Test(given: 2.0005, want: 'dwa i dwie dziesięciotysięcznych'),
      // Test(given: 2.0015, want: 'dwa i piętnaście dziesięciotysięcznych'),
      // Test(
      //     given: 2.0432,
      //     want: 'dwa i czterysta trzydziesci dwie dziesięciotysięczne'),
      // Test(
      //     given: 2.0435,
      //     want: 'dwa i czterysta trzydziesci pięć dziesięciotysięcznych'),
      // Test(
      //     given: 2.5435,
      //     want:
      //         'dwa i pięć tysięcy czterysta trzydziesci pięć dziesięciotysięcznych'),
      // Test(
      //     given: -2.5435,
      //     want:
      //         'minus dwa i pięć tysięcy czterysta trzydziesci pięć dziesięciotysięcznych'),
      // Test(given: -1.25, want: 'minus jeden i dwadzieścia pięć setnych'),
    ],
  )
];
