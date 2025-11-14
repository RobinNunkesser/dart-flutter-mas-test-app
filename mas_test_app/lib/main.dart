// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Provide the model to all widgets within the app. We're using
    // ChangeNotifierProvider because that's a simple way to rebuild
    // widgets when a model changes. We could also just use
    // Provider, but then we would have to listen to Counter ourselves.
    //
    // Read Provider's docs to learn about all the available providers.
    ChangeNotifierProvider(
      // Initialize the model in the builder. That way, Provider
      // can own Counter's lifecycle, making sure to call `dispose`
      // when not needed anymore.
      create: (context) => Counter(),
      child: const MyApp(),
    ),
  );
}

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`. [Counter] does
/// _not_ depend on Provider.
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
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
      //appBar: AppBar(title: const Text('MAS Test App')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'OWASP MAS',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF02D6A9), Color(0xFF479FFF)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        var counter = context.read<Counter>();
                        counter.increment();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Start'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                  const Text('You have pushed the button this many times:'),
                  Consumer<Counter>(
                    builder: (context, counter, child) => Text(
                      '${counter.value}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
