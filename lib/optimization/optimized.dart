import 'package:flutter/material.dart';

class OptimizedDemo extends StatefulWidget {
  const OptimizedDemo({super.key});

  @override
  State<OptimizedDemo> createState() => _OptimizedDemoState();
}

class _OptimizedDemoState extends State<OptimizedDemo> {
  final notifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print('BUILD');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              notifier.value++;
            },
            child: const Text('Make +1'),
          ),
          ValueListenableBuilder<int>(
            valueListenable: notifier,
            builder: (_, value, __) {
              return Text('Value: $value');
            },
          ),
        ],
      ),
    );
  }
}
