import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  // Mengubah InheritedWidget menjadi ChangeNotifier
  User _user = User(name: '', email: '');
  bool _isLoading = true;
  bool _isDarkMode = false;
  int _visitCount = 0;
  List<String> _favorites = [];

  // Getter data
  User get user => _user;
  bool get isLoading => _isLoading;
  bool get isDarkMode => _isDarkMode;
  int get visitCount => _visitCount;
  List<String> get favorites => _favorites;

  // Memuat data dari SharedPreferences
  UserProvider() {
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // ....
    _isDarkMode = prefs.getBool('is_dark_mode') ?? false;

    _visitCount = (prefs.getInt('visit_count') ?? 0) + 1;
    await prefs.setInt('visit_count', _visitCount);

    _favorites = prefs.getStringList('favorites') ?? [];

    _isLoading = false;
    notifyListeners();
  }


  Future<bool> isEmailTaken(String email) async {
  final prefs = await SharedPreferences.getInstance();
  final registeredEmails =
      prefs.getStringList('registered_emails') ?? [];

  if (email == _user.email) return false;

  return registeredEmails.contains(email);
}

  // Memperbarui profil dan menyimpan data
  Future<void> updateUser(User updatedUser) async {
    final prefs = await SharedPreferences.getInstance();
    // ....
    _user = updatedUser;

    // Menyimpan email yang telah terdaftar
    final emails = prefs.getStringList('registered_emails') ?? [];
    if (!emails.contains(updatedUser.email)) {
      emails.add(updatedUser.email);
      await prefs.setStringList('registered_emails', emails);
    }
    // ....
    notifyListeners();
  }

  // Fungsi logout
  Future<void> logout() async {
    // ....
    _user = User(name: '', email: '', isLoggedIn: false);
    // ....
    notifyListeners();
  }

  // Mengubah Dark Mode
  Future<void> toggleTheme() async {
    // ....
    _isDarkMode = !_isDarkMode;
    // ....
    notifyListeners();
  }

  // Menambah dan menghapus Favorites
  Future<void> addFavorite(String item) async {
    if (_favorites.contains(item)) return;

    _favorites = [..._favorites, item];
    // ....
    notifyListeners();
  }

  Future<void> removeFavorite(String item) async {
    _favorites = _favorites.where((favorite) => favorite != item).toList();
    // ....
    notifyListeners();
  }
}
