// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LifecycleActivateDemo extends StatefulWidget {
  const LifecycleActivateDemo({super.key});

  @override
  State<LifecycleActivateDemo> createState() => _LifecycleActivateDemoState();
}

class _LifecycleActivateDemoState extends State<LifecycleActivateDemo> {
  int value = 0;
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LifecycleInherited(
      value: value,
      child: Center(
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
              LifecycleInheritedListener(
                key: _key,
                // value: value,
              )
            else
              Center(
                child: LifecycleInheritedListener(
                  key: _key,
                  // value: value,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LifecycleInheritedListener extends StatefulWidget {
  const LifecycleInheritedListener({
    // required this.value,
    super.key,
  });

  // final int value;

  @override
  State<LifecycleInheritedListener> createState() =>
      _LifecycleInheritedListenerState();
}

class _LifecycleInheritedListenerState
    extends State<LifecycleInheritedListener> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies: $hashCode');
  }

  @override
  void didUpdateWidget(covariant LifecycleInheritedListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget $hashCode');
  }

  @override
  void activate() {
    super.activate();
    print('activate $hashCode');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate $hashCode');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose $hashCode');
  }

  @override
  Widget build(BuildContext context) {
    // final value = widget.value;
    final value = LifecycleInherited.of(context);
    print('Element: ${context.hashCode}, State: $hashCode');
    return Text('Value: $value');
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
