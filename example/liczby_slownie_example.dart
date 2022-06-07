import 'package:liczby_slownie/liczby_slownie.dart';

void main(List<String> args) {
  final nw = NumberWord();
  const ints = [
    -9902,
    -783,
    -13,
    -1,
    0,
    69,
    336,
    465741,
    3569323,
    630509012,
    904073456789
  ];

  for (var i in ints) {
    print('$i \t-> ${nw.intToWord(i)}');
  }

  print('');
  print('');

  const prices = [
    -100.02,
    -77.64,
    -32.0,
    -21.62,
    0.69,
    11.88,
    101.4,
    213.30,
    985.41,
    996.6,
    1018.98
  ];

  for (var n in prices) {
    print('w sumie: ${n.toStringAsFixed(2)} PLN, \t słownie: ${nw.translatePrice(n)}');
  }
}
