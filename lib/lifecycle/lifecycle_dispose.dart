// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LifecycleDisposeDemo extends StatefulWidget {
  const LifecycleDisposeDemo({super.key});

  @override
  State<LifecycleDisposeDemo> createState() => _LifecycleDisposeDemoState();
}

class _LifecycleDisposeDemoState extends State<LifecycleDisposeDemo> {
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
          if (value.isEven) LifecycleListener(value: value)
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
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('Dispose');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  Widget build(BuildContext context) {
    return Text('Value: ${widget.value}');
  }
}
