class Test {
  final num given;
  final String want;
  final String? _desc;
  String get desc {
    return 'given: $given, desc: $_desc';
  }

  const Test({
    required this.given,
    required this.want,
    desc,
  }) : _desc = desc;
}

class TestCase {
  final List<Test> cases;
  final String desc;

  TestCase({
    required this.desc,
    required this.cases,
  });
}
