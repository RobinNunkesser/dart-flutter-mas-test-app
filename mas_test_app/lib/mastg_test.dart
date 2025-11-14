import 'package:mas_test_app/demo_results.dart';

/// A test class for OWASP MAS (Mobile Application Security) testing.
///
/// This class provides functionality to execute MAS tests and collect results
/// for demonstration purposes.
class MastgTest {
  /// Executes a MASTG (Mobile Application Security Testing Guide) test.
  ///
  /// This method demonstrates three different test case scenarios:
  /// 1. A test case that passes successfully
  /// 2. A test case that fails intentionally
  /// 3. A test case that encounters an error/exception
  ///
  /// The method logs a sensitive string for testing purposes and captures
  /// the results of each test case scenario.
  ///
  /// Returns a [DemoResults] object containing the test outcomes with:
  /// - `demoId`: Set to '0000'
  /// - Multiple test results showing pass, fail, and error states
  ///
  /// Throws an [Exception] as part of the demonstration to show error handling.
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
