// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class LifecycleDidChangeDemo extends StatefulWidget {
  const LifecycleDidChangeDemo({super.key});

  @override
  State<LifecycleDidChangeDemo> createState() => _LifecycleDidChangeDemoState();
}

class _LifecycleDidChangeDemoState extends State<LifecycleDidChangeDemo> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LifecycleInherited(
        value: value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() => value++);
              },
              child: const Text('Make +1'),
            ),
            const LifecycleInheritedListener(),
          ],
        ),
      ),
    );
  }
}

class LifecycleInherited extends InheritedWidget {
  const LifecycleInherited({
    required this.value,
    required Widget child,
    super.key,
  }) : super(child: child);

  final int value;

  static int? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LifecycleInherited>()
        ?.value;
  }

  @override
  bool updateShouldNotify(LifecycleInherited oldWidget) {
    return true;
  }
}

class LifecycleInheritedListener extends StatefulWidget {
  const LifecycleInheritedListener({super.key});

  @override
  State<LifecycleInheritedListener> createState() =>
      _LifecycleInheritedListenerState();
}

class _LifecycleInheritedListenerState
    extends State<LifecycleInheritedListener> {
  int? value;

  @override
  void didUpdateWidget(covariant LifecycleInheritedListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // разницы нет здесь или в build
    value = LifecycleInherited.of(context) ?? -1;
    print('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    // разницы нет здесь или в didChangeDependencies
    // value = LifecycleInherited.of(context) ?? -1;
    return Text('Value: $value');
  }
}
