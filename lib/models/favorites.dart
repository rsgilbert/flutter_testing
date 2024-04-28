import 'package:flutter/material.dart';


/// The [Favorites] class holds a list of favorite items
class Favorites extends ChangeNotifier {
  final List<int> _favoriteItems  = [];

  List<int> get items => _favoriteItems;

  void add(int itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }

}