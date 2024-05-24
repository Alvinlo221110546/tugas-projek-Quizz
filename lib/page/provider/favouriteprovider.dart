import 'package:flutter/material.dart';

class FavoriteModel with ChangeNotifier {
  final Set<Map<String, String>> _favorites = Set<Map<String, String>>();

  Set<Map<String, String>> get favorites => _favorites;

  void toggleFavorite(Map<String, String> item) {
    if (_favorites.any((element) => element['title'] == item['title'])) {
      _favorites.removeWhere((element) => element['title'] == item['title']);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(String title) {
    return _favorites.any((element) => element['title'] == title);
  }
}
