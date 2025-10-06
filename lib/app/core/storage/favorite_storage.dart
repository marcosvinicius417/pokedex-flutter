import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorage {
  static const _key = 'favorite_pokemon';

  static Future<void> saveFavorites(List<String> favorites) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_key, jsonEncode(favorites));
  }

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null) return [];

    return List<String>.from(jsonDecode(data));
  }
}
