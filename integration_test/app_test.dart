import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';

void main() {
  group('Testing App', () {
    testWidgets('Favorites operations test', (tester) async {
      await tester.pumpWidget(const TestingApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2'
      ];

      for(var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Added to favorites'), findsOneWidget);
      }

       for(var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Removed from favorites'), findsOneWidget);
      }

      // final removeIconKeys = [
      //   'remove_icon_0',
      //   'remove_icon_1',
      //   'remove_icon_2'
      // ]
     });
  });
}

// to run, use the command:
// flutter test .\integration_test\app_test.dart