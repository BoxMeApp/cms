import 'package:flutter/material.dart';

import 'couter/view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Counter App', home: CounterPage());
  }
}
