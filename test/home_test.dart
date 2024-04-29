import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/models/favorites.dart';
import 'package:flutter_testing/screens/home.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: const MaterialApp(home: HomePage()),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing if ListView shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('testing scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('Testing IconButtons', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle();
      expect(find.text('Added to favorites'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle();
      expect(find.text('Removed from favorites'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}