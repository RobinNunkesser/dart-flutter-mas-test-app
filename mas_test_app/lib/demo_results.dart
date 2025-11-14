import 'package:logging/logging.dart';

final log = Logger('MASTestAppLogger');

/// A collection of demo test results for a specific demo.
///
/// This class manages and logs the results of demo tests, automatically
/// setting up logging configuration when instantiated. Each result is
/// logged with appropriate severity levels based on the test status.
///
/// Example:
/// ```dart
/// final results = DemoResults(demoId: '0001');
/// results.add(Status.pass, 'Test completed successfully');
/// ```
class DemoResults {
  final String demoId;
  List<DemoResult> demoResults = [];

  DemoResults({required this.demoId}) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  /// Adds a new test result to the collection.
  ///
  /// Logs the result with appropriate severity:
  /// - [Status.pass]: Logged as INFO
  /// - [Status.fail]: Logged as INFO
  /// - [Status.error]: Logged as SEVERE
  ///
  /// Parameters:
  /// - [status]: The outcome status of the test
  /// - [message]: A descriptive message about the test result
  void add(Status status, String message) {
    demoResults.add(
      DemoResult(demoId: demoId, status: status, message: message),
    );
    switch (status) {
      case Status.pass:
        log.info('MASTG-DEMO-$demoId demonstrated a successful test: $message');
        break;
      case Status.fail:
        log.info('MASTG-DEMO-$demoId demonstrated a failed test: $message');
        break;
      case Status.error:
        log.severe('MASTG-DEMO-$demoId failed: $message');
        break;
    }
  }
}

/// Represents a single demo test result.
///
/// Contains information about a specific test execution including its
/// status, the demo identifier it belongs to, and a descriptive message.
///
/// This is an immutable data class used to store test outcomes.
class DemoResult {
  final Status status;
  final String demoId;
  final String message;

  DemoResult({
    required this.demoId,
    required this.status,
    required this.message,
  });
}

/// The outcome status of a demo test.
///
/// - [fail]: Test failed to meet expected criteria
/// - [pass]: Test completed successfully
/// - [error]: Test encountered an error during execution
enum Status { fail, pass, error }
