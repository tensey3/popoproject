import 'package:flutter/material.dart';

class GenreProvider extends ChangeNotifier {
  List<String> _selectedGenres = ['ポップ'];

  List<String> get selectedGenres => _selectedGenres;

  void setSelectedGenres(List<String> genres) {
    _selectedGenres = genres;
    notifyListeners();
  }

  void toggleGenre(String genre) {
    if (_selectedGenres.contains(genre)) {
      _selectedGenres.remove(genre);
    } else {
      _selectedGenres.add(genre);
    }
    notifyListeners();
  }
}