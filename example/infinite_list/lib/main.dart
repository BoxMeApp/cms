import 'package:flutter/material.dart';

import 'post/view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostPage(),
    );
  }
}
