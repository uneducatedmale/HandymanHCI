//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:handyapp/main.dart'; // Make sure 'handyapp' matches your pubspec.yaml name

void main() {
  testWidgets('App loads and home page shows expected text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HandymanApp());

    // Check if the title text is found
    expect(find.text('Handyman App'), findsOneWidget);

    // Optional: Check if the quote is also present
    expect(find.text('"For the handiest of men (and women too!)"'), findsOneWidget);
  });
}
