import 'package:flutter/material.dart';
import 'package:flutter_testing/models/favorites.dart';
import 'package:flutter_testing/screens/favorites.dart';
import 'package:flutter_testing/screens/home.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TestingApp());
}

class TestingApp extends StatelessWidget {
  const TestingApp({ super.key });

  @override 
  Widget build(BuildContext context){
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router( 
        title: 'Testing Sample',
        theme: ThemeData( 
          primarySwatch: Colors.blue,
          useMaterial3: true
        ),
        routerConfig: _router,
      ));
  }

}


final _router = GoRouter(routes: [
  GoRoute(
    path: HomePage.routeName,
    builder: (context, state) => const HomePage(),
    routes: [
      GoRoute(
        path: FavoritesPage.routeName,
        builder: (context, state) => const FavoritesPage())
    ]
    )
]);