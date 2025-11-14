import 'package:flutter/foundation.dart';
import 'package:mas_test_app/demo_results.dart';

class Result with ChangeNotifier {
  List<DemoResult> demoResults = [];
  void update(List<DemoResult> newResults) {
    demoResults = newResults;
    notifyListeners();
  }
}
