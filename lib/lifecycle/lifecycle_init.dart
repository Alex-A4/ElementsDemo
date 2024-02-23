// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LifecycleInitDemo extends StatefulWidget {
  const LifecycleInitDemo({super.key});

  @override
  State<LifecycleInitDemo> createState() => _LifecycleInitDemoState();
}

class _LifecycleInitDemoState extends State<LifecycleInitDemo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LifecycleListener(),
    );
  }
}

class LifecycleListener extends StatefulWidget {
  const LifecycleListener({
    super.key,
  });

  @override
  StatefulElement createElement() {
    print('createElement');
    return super.createElement();
  }

  @override
  // ignore: no_logic_in_create_state
  State<LifecycleListener> createState() {
    print('createState');
    return _LifecycleListenerState();
  }
}

class _LifecycleListenerState extends State<LifecycleListener> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return const Text('Text');
  }
}
