const unitiesArr = [
  '',
  ' jeden',
  ' dwa',
  ' trzy',
  ' cztery',
  ' pięć',
  ' sześć',
  ' siedem',
  ' osiem',
  ' dziewięć'
];

const teensArr = [
  '',
  ' jedenaście',
  ' dwanaście',
  ' trzynaście',
  ' czternaście',
  ' piętnaście',
  ' szesnaście',
  ' siedemnaście',
  ' osiemnaście',
  ' dziewiętnaście'
];

final tensArr = [
  '',
  ' dziesięć',
  '${unitiesArr[2]}dzieścia',
  '${unitiesArr[3]}dzieści',
  '${unitiesArr[4]}dzieści',
  '${unitiesArr[5]}dziesiąt',
  '${unitiesArr[6]}dziesiąt',
  '${unitiesArr[7]}dziesiąt',
  '${unitiesArr[8]}dziesiąt',
  '${unitiesArr[9]}dziesiąt'
];

final hundredsArr = [
  '',
  ' sto',
  ' dwieście',
  '${unitiesArr[3]}sta',
  '${unitiesArr[4]}sta',
  '${unitiesArr[5]}set',
  '${unitiesArr[6]}set',
  '${unitiesArr[7]}set',
  '${unitiesArr[8]}set',
  '${unitiesArr[9]}set'
];

const rowsOfMagnitude = <List<String>>[
  ['', '', ''],
  [' tysiąc', ' tysiące', ' tysięcy'],
  [' milion', ' miliony', ' milionów'],
  [' miliard', ' miliardy', ' miliardów'],
  [' bilion', ' biliony', ' bilionów'],
  [' biliard', ' biliardy', ' biliardów'],
  [' trylion', ' tryliony', ' trylionów'],
];

const decimalRowsOfMagnitude = <List<String>>[
  ['', '', ''],
  [' dziesiętna', ' dziesiętne', ' dziesiętnych'],
  [' setna', ' setne', ' setnych'],
  [' tysięczna', ' tysięczne', ' tysięcznych'],
  [' dziesięciotysięczna', ' dziesięciotysięczne', ' dziesięciotysięcznych'],
  [' stotysięczna', ' stotysięczne', ' stotysięcznych'],
  [' milionowa', ' milionowe', ' milionowych'],
];
