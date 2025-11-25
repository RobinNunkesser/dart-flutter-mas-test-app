import 'package:mas_test_app/mastg_test.dart';
import 'package:test/test.dart';

void main() {
  test('MastgTest method runs successfully', () async {
    final mastgTest = MastgTest();
    final result = await mastgTest.mastgTest();
    for (var demoResult in result.demoResults) {
      print('Status: ${demoResult.status}, Message: ${demoResult.message}');
    }
  });
}
