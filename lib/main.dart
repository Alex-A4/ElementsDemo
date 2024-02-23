import 'package:elements_demo/const/const_demo.dart';
import 'package:elements_demo/lifecycle/lifecycle_activate.dart';
import 'package:elements_demo/lifecycle/lifecycle_did_change.dart';
import 'package:elements_demo/lifecycle/lifecycle_did_update.dart';
import 'package:elements_demo/lifecycle/lifecycle_dispose.dart';
import 'package:elements_demo/lifecycle/lifecycle_init.dart';
import 'package:elements_demo/optimization/optimized.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LifecycleInitDemo(),
        // body: LifecycleDidChangeDemo(),
        // body: LifecycleDidUpdateDemo(),
        // body: LifecycleDisposeDemo(),
        // body: LifecycleActivateDemo(),
        // body: ConstDemo(),
        // body: OptimizedDemo(),
      ),
    );
  }
}
