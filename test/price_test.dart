import 'package:liczby_slownie/src/liczby_slownie_base.dart' show FloatingPointNumber;
import 'package:liczby_slownie/liczby_slownie.dart';
import 'package:test/test.dart';

import 'test_case.dart';

void main() {
  group('Test money', () {
    test('prices as double', () {
      var nw = NumberWord();
      for (int i = 0; i < _tests.length; i++) {
        num d = _tests[i].given;
        expect(
          nw.translatePrice(_tests[i].given),
          equals(_tests[i].want),
          reason: _tests[i].desc,
        );
      }
    });
    test('prices as integer & decimal parts', () {
      var nw = NumberWord();
      for (int i = 0; i < _tests.length; i++) {
        late final FloatingPointNumber d;
        switch (_tests[i].given.runtimeType) {
          case double:
            d = FloatingPointNumber.fromPrice(_tests[i].given as double);
            break;
          case int:
            d = FloatingPointNumber.fromPrice((_tests[i].given).toDouble());
        }
        expect(
          nw.translatePrice(
            d.integer,
            d.decimal,
          ),
          equals(_tests[i].want),
          reason: _tests[i].desc,
        );
      }
    });

    test('prices as integer & decimal parts', () {
      var nw = NumberWord();
      expect(
        nw.translatePrice(
          0,
        ),
        equals('zero złotych, zero groszy'),
      );
      expect(
        nw.translatePrice(
          -0,
        ),
        equals(
          'zero złotych, zero groszy',
        ),
        reason: 'zero is zero',
      );
      expect(
        nw.translatePrice(-0, 0, true),
        equals(
          'zero złotych, zero groszy',
        ),
        reason: 'zero is zero',
      );
      expect(
        nw.translatePrice(0, 0),
        equals('zero złotych, zero groszy'),
      );
      expect(
        nw.translatePrice(
          22,
        ),
        equals('dwadzieścia dwa złote, zero groszy'),
      );
      expect(
        nw.translatePrice(
          0,
          21,
        ),
        equals('zero złotych, dwadzieścia jeden groszy'),
      );
      expect(
        nw.translatePrice(-0, 23, true),
        equals('minus zero złotych, dwadzieścia trzy grosze'),
      );
      expect(
        nw.translatePrice(
          4521,
          23,
        ),
        equals(
            'cztery tysiące pięćset dwadzieścia jeden złotych, dwadzieścia trzy grosze'),
      );
      expect(
        nw.translatePrice(
          452,
          69,
        ),
        equals(
            'czterysta pięćdziesiąt dwa złote, sześćdziesiąt dziewięć groszy'),
      );
    });
  });
}

final _tests = <Test>[
  Test(given: 0.00, want: 'zero złotych, zero groszy'),
  Test(given: 1.00, want: 'jeden złoty, zero groszy'),
  Test(given: 2.00, want: 'dwa złote, zero groszy'),
  Test(given: 5.00, want: 'pięć złotych, zero groszy'),
  Test(given: 12.00, want: 'dwanaście złotych, zero groszy'),
  Test(given: 20.00, want: 'dwadzieścia złotych, zero groszy'),
  Test(given: 22.00, want: 'dwadzieścia dwa złote, zero groszy'),
  Test(given: 22, want: 'dwadzieścia dwa złote, zero groszy'),
  Test(given: 0.1, want: 'zero złotych, dziesięć groszy'),
  Test(given: 0.10, want: 'zero złotych, dziesięć groszy'),
  Test(given: 0.3, want: 'zero złotych, trzydzieści groszy'),
  Test(given: 0.7, want: 'zero złotych, siedemdziesiąt groszy'),
  Test(
      given: 222.73,
      want: 'dwieście dwadzieścia dwa złote, siedemdziesiąt trzy grosze'),
  Test(
      given: 1222.73,
      want:
          'jeden tysiąc dwieście dwadzieścia dwa złote, siedemdziesiąt trzy grosze'),
  Test(
      given: 11222.73,
      want:
          'jedenaście tysięcy dwieście dwadzieścia dwa złote, siedemdziesiąt trzy grosze'),
  Test(
      given: 131222.73,
      want:
          'sto trzydzieści jeden tysięcy dwieście dwadzieścia dwa złote, siedemdziesiąt trzy grosze'),
  Test(
      given: 4131222.75,
      want:
          'cztery miliony sto trzydzieści jeden tysięcy dwieście dwadzieścia dwa złote, siedemdziesiąt pięć groszy'),
  Test(
      given: 64131222.5,
      want:
          'sześćdziesiąt cztery miliony sto trzydzieści jeden tysięcy dwieście dwadzieścia dwa złote, pięćdziesiąt groszy'),
  Test(
      given: 264131221.59,
      want:
          'dwieście sześćdziesiąt cztery miliony sto trzydzieści jeden tysięcy dwieście dwadzieścia jeden złotych, pięćdziesiąt dziewięć groszy'),
  Test(
      given: 9264131221.69,
      want:
          'dziewięć miliardów dwieście sześćdziesiąt cztery miliony sto trzydzieści jeden tysięcy dwieście dwadzieścia jeden złotych, sześćdziesiąt dziewięć groszy'),
  Test(
      given: 39264131227.01,
      want:
          'trzydzieści dziewięć miliardów dwieście sześćdziesiąt cztery miliony sto trzydzieści jeden tysięcy dwieście dwadzieścia siedem złotych, jeden grosz'),
  Test(
      given: 392656131227.02,
      want:
          'trzysta dziewięćdziesiąt dwa miliardy sześćset pięćdziesiąt sześć milionów sto trzydzieści jeden tysięcy dwieście dwadzieścia siedem złotych, dwa grosze'),
  Test(
      given: 3926561321227.05,
      want:
          'trzy biliony dziewięćset dwadzieścia sześć miliardów pięćset sześćdziesiąt jeden milionów trzysta dwadzieścia jeden tysięcy dwieście dwadzieścia siedem złotych, pięć groszy'),
  Test(
      given: 39265613212270.05,
      want:
          'trzydzieści dziewięć bilionów dwieście sześćdziesiąt pięć miliardów sześćset trzynaście milionów dwieście dwanaście tysięcy dwieście siedemdziesiąt złotych, pięć groszy'),
  // exceeds max double
  // Test(given: 300000132122700.04, want: 'trzysta bilionów sto trzydzieści dwa miliony sto dwadzieścia dwa tysiące siedemset złotych, cztery grosze'),
  // Test(given: 1234567890123456.99, want: 'jeden biliard jeden złoty, jeden grosz'),
  // Test(given: 1000000000000001.01, want: 'jeden biliard jeden złoty, jeden grosz'),
  // Test(given: 1000000000000001, want: 'jeden biliard jeden złoty, zero groszy'),
  // Test(given: 1000000000000001000.01, want: 'jeden trylion jeden tysiąc złotych, jeden grosz'),
  // Test(given: 1000000000000001000, want: 'jeden trylion jeden tysiąc złotych, zero groszy'),
];
