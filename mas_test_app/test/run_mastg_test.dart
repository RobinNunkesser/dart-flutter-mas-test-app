import 'package:mas_test_app/mastg_test.dart';
import 'package:test/test.dart';

void main() {
  test('MastgTest method runs successfully', () {
    final mastgTest = MastgTest();
    final result = mastgTest.mastgTest();
    for (var demoResult in result.demoResults) {
      print('Status: ${demoResult.status}, Message: ${demoResult.message}');
    }
  });
}
