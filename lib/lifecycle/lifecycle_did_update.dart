// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LifecycleDidUpdateDemo extends StatefulWidget {
  const LifecycleDidUpdateDemo({super.key});

  @override
  State<LifecycleDidUpdateDemo> createState() => _LifecycleDidUpdateDemoState();
}

class _LifecycleDidUpdateDemoState extends State<LifecycleDidUpdateDemo> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
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
          if (value.isEven)
            LifecycleListener(value: value)
          else
            Center(
              child: LifecycleListener(value: value),
            ),
        ],
      ),
    );
  }
}

class LifecycleListener extends StatefulWidget {
  const LifecycleListener({
    required this.value,
    super.key,
  });

  final int value;

  @override
  State<LifecycleListener> createState() => _LifecycleListenerState();
}

class _LifecycleListenerState extends State<LifecycleListener> {
  @override
  void didUpdateWidget(covariant LifecycleListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget. Old: ${oldWidget.value}. New: ${widget.value}');
  }

  @override
  Widget build(BuildContext context) {
    print('Element: ${(context as Element).hashCode}');
    return Text('Value: ${widget.value}');
  }
}
