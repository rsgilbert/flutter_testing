import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/models/favorites.dart';
import 'package:flutter_testing/screens/favorites.dart';
import 'package:provider/provider.dart';

late Favorites favoritesList;

Widget createFavoritesScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: const MaterialApp(home: FavoritesPage()),
    );

void addItems() {
  for(var i = 0; i < 10; i+=2) {
    favoritesList.add(i);
  }
}

void main() {
  group('Favorites Page Widget Tests', () {
    testWidgets('Test if ListView shows up', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      // addItems();
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing remove button', (widgetTester) async {
      await widgetTester.pumpWidget(createFavoritesScreen());
      addItems();
      await widgetTester.pumpAndSettle();
      var initialTotalItems = widgetTester.widgetList(find.byIcon(Icons.close)).length;
      expect(initialTotalItems == 5, true);
      await widgetTester.tap(find.byIcon(Icons.close).first);
      await widgetTester.pumpAndSettle();
      var newTotalItems = widgetTester.widgetList(find.byIcon(Icons.close)).length;
      expect(newTotalItems, lessThan(initialTotalItems));
      expect(find.text('Removed from favorites'), findsOneWidget);

    });
  });
}
