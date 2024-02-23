// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

int value = 0;

class ConstDemo extends StatefulWidget {
  const ConstDemo({super.key});

  @override
  State<ConstDemo> createState() => _ConstDemoState();
}

class _ConstDemoState extends State<ConstDemo> {
  @override
  Widget build(BuildContext context) {
    print('Value: $value');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() => value++);
            },
            child: const Text('Make +1'),
          ),
          const LifecycleListener(),
        ],
      ),
    );
  }
}

class LifecycleListener extends StatefulWidget {
  const LifecycleListener({
    super.key,
  });

  @override
  State<LifecycleListener> createState() => _LifecycleListenerState();
}

class _LifecycleListenerState extends State<LifecycleListener> {
  @override
  Widget build(BuildContext context) {
    print('StatelessBuild');
    return Text('Value: $value');
  }
}
