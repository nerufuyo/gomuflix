import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds a Text widget', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('GOMUFLIX'),
      ),
    ));

    expect(find.text('GOMUFLIX'), findsOneWidget);
  });
}
