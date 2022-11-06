import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imbi/pages/bmi_page.dart';

void main() {
  testWidgets(
      "Given weightInfoCard user on BMIPage When user click + button Then weight increment by one",
      (tester) async {
    // Arrange
    await tester.pumpWidget(
      CupertinoApp(
        home: BMIPage(),
      ),
    );
    var _weightIncrementButton = find.byKey(
      Key("weight_plus"),
    );
    // Act
    await tester.tap(_weightIncrementButton);
    await tester.pump();
    // Assert
    var _text = find.text('61');
    expect(_text, findsOneWidget);
  });

  testWidgets(
      "Given weightInfoCard user on BMIPage When user click - button Then weight decrement by one",
      (tester) async {
    // Arrange
    await tester.pumpWidget(
      CupertinoApp(
        home: BMIPage(),
      ),
    );
    var _weightDecrementButton = find.byKey(
      Key("weight_minus"),
    );
    // Act
    await tester.tap(_weightDecrementButton);
    await tester.pump();
    // Assert
    var _text = find.text('59');
    expect(_text, findsOneWidget);
  });
}
