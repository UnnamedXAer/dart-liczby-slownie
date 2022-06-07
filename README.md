It's small library for translating numbers and prices into polish words.

## Features

- translates integers to polish words
- translates money amount into polish words

## Usage

see examples in the `/example` folder.

```dart
import 'package:liczby_slownie/liczby_slownie.dart';

void main(List<String> args) {
  final nw = NumberWord();

  const ints = [-9902, -783, -13, -1, 0, 69, 336, 465741, 3569323, 630509012, 904073456789];
  for (var i in ints) {
    print('$i \t= ${nw.intToWord(i)}');
  }
}
```
```js
-9902   		= minus dziewięć tysięcy dziewięćset dwa
-783    		= minus siedemset osiemdziesiąt trzy
-13     		= minus trzynaście
-1      		= minus jeden
0       		= zero
69      		= sześćdziesiąt dziewięć
336     		= trzysta trzydzieści sześć
465741  		= czterysta sześćdziesiąt pięć tysięcy siedemset czterydzieści jeden
3569323         = trzy miliony pięćset sześćdziesiąt dziewięć tysięcy trzysta dwadzieścia trzy
630509012       = sześćset trzydzieści milionów pięćset dziewięć tysięcy dwanaście
904073456789    = dziewięćset cztery miliardy siedemdziesiąt trzy miliony czterysta pięćdziesiąt sześć tysięcy siedemset osiemdziesiąt dziewięć
```

```dart
import 'package:liczby_slownie/liczby_slownie.dart';

void main(List<String> args) {
  final nw = NumberWord();

  const prices = [-100.02, -77.64, -32.0, -21.62, 0.69, 11.88, 101.4, 213.30, 985.41, 996.6, 1018.98];

  for (var n in prices) {
    print('${n.toStringAsFixed(2)} \t= ${nw.translatePrice(n)}');
  }
}
```
```js
-100.02         = minus sto złotych, dwa grosze
-77.64  		= minus siedemdziesiąt siedem złotych, sześćdziesiąt cztery grosze
-32.00  		= minus trzydzieści dwa złote, zero groszy
-21.62  		= minus dwadzieścia jeden złotych, sześćdziesiąt dwa grosze
0.69    		= zero złotych, sześćdziesiąt dziewięć groszy
11.88   		= jedenaście złotych, osiemdziesiąt osiem groszy
101.40  		= sto jeden złotych, czterydzieści groszy
213.30  		= dwieście trzynaście złote, trzydzieści groszy
985.41  		= dziewięćset osiemdziesiąt pięć złotych, czterydzieści jeden groszy
996.60  		= dziewięćset dziewięćdziesiąt sześć złotych, sześćdziesiąt groszy
1018.98         = jeden tysiąc osiemnaście złotych, dziewięćdziesiąt osiem groszy
```