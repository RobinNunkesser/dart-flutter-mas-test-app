import 'package:flutter/foundation.dart';
import 'package:mas_test_app/demo_results.dart';

class Result with ChangeNotifier {
  DemoResults demoResults = DemoResults(demoId: '0000');
  void update(DemoResults newResults) {
    demoResults = newResults;
    notifyListeners();
  }
}
