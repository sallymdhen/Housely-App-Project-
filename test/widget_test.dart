import 'package:flutter/material.dart';
import 'package:flutter_application_team2/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App launches and shows splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.byType(Image), findsOneWidget);
  });
}
