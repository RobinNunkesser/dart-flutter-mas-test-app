import 'package:flutter/foundation.dart';
import 'package:mas_test_app/demo_results.dart';

/// A [ChangeNotifier] class that manages and tracks a list of [DemoResult] objects.
///
/// This class provides a simple state management solution for storing and updating
/// demo results, notifying all listeners whenever the results are updated.
///
/// Example usage:
/// ```dart
/// final result = Result();
/// result.addListener(() {
///   print('Results updated: ${result.demoResults}');
/// });
/// result.update([DemoResult(...)]);
/// ```
class Result with ChangeNotifier {
  List<DemoResult> demoResults = [];
  void update(List<DemoResult> newResults) {
    demoResults = newResults;
    notifyListeners();
  }
}
