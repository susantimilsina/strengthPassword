import 'package:flutter_test/flutter_test.dart';
import 'package:strengthpassword/src/procedures.dart';

import 'package:strengthpassword/strengthpassword.dart';

void main() {
  test('adds one to input values', () {
    final calculator = strengthPassword("hahaha");
    expect(calculator, 'weak');
  });
}
