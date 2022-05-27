class Test {
  final num given;
  final String want;
  final String? desc;

  const Test({
    required this.given,
    required this.want,
    this.desc,
  });
}

class TestCase {
  final List<Test> cases;
  final String desc;

  TestCase({
    required this.desc,
    required this.cases,
  });
}
