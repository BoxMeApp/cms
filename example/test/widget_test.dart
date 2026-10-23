import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/01-counter/view.dart';

void main() {
  /// 计数器页面支持增加和减少。
  testWidgets('Counter increments and decrements', (tester) async {
    // dart format off
    await tester.pumpWidget(const MaterialApp(home: CounterPage()));
                                                              expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();                                       expect(find.text('1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();                                       expect(find.text('0'), findsOneWidget);
    // dart format on
  });
}
