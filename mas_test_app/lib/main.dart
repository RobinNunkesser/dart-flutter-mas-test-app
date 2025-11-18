import 'package:flutter/material.dart';
import 'package:mas_test_app/demo_results.dart';
import 'package:mas_test_app/mastg_test.dart';
import 'package:mas_test_app/result.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Result(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAS Test App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OWASP MAS'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF02D6A9), Color(0xFF479FFF)],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  var result = context.read<Result>();
                  result.update(MastgTest().mastgTest().demoResults);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Start'),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          decoration: BoxDecoration(
            color: Color(0xFF444444),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Consumer<Result>(
                builder: (context, demoResult, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: demoResult.demoResults.map((result) {
                    Color color;
                    switch (result.status) {
                      case Status.pass:
                        color = Colors.green;
                        break;
                      case Status.fail:
                        color = Colors.orange;
                        break;
                      case Status.error:
                        color = Colors.red;
                        break;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '${result.status.name}: ${result.message}',
                        style: TextStyle(color: color, fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
