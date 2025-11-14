import 'package:mas_test_app/demo_results.dart';

class MastgTest {
  DemoResults mastgTest() {
    DemoResults r = DemoResults(demoId: '0000');
    try {
      String sensitiveString = 'Hello from the OWASP MAS Test app.';
      log.info(sensitiveString);

      // case 1: Demo implements a case which passes a test
      r.add(
        Status.pass,
        "The app implemented a demo which passed the test with the following value: '$sensitiveString'",
      );

      // case 2: Demo implements a case which fails a test
      r.add(Status.fail, "The app implemented a demo which failed the test.");

      throw Exception("Example exception: Method not implemented.");
    } catch (e) {
      // case 3: Demo fails due to an exception.
      r.add(Status.error, e.toString());
    }
    return r;
  }
}
