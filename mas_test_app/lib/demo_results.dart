import 'package:logging/logging.dart';

final log = Logger('MASTestAppLogger');

class DemoResults {
  final String demoId;
  List<DemoResult> demoResults = [];

  DemoResults({required this.demoId}) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

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

enum Status { fail, pass, error }
