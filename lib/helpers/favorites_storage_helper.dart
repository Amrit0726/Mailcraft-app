import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper class to manage favorite templates
class FavoritesStorageHelper {
  static const String _storageKey = 'favorite_template_ids';

  /// Save favorite template IDs to local storage
  static Future<bool> saveFavorites(List<String> favoriteIds) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(favoriteIds);
      return await prefs.setString(_storageKey, jsonString);
    } catch (e) {
      print('Error saving favorites: $e');
      return false;
    }
  }

  /// Load favorite template IDs from local storage
  static Future<List<String>> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_storageKey);
      
      if (jsonString == null || jsonString.isEmpty) {
        return []; // No saved favorites
      }
      
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.cast<String>();
    } catch (e) {
      print('Error loading favorites: $e');
      return [];
    }
  }

  /// Add a template to favorites
  static Future<bool> addFavorite(String templateId) async {
    final favorites = await loadFavorites();
    if (!favorites.contains(templateId)) {
      favorites.add(templateId);
      return await saveFavorites(favorites);
    }
    return true;
  }

  /// Remove a template from favorites
  static Future<bool> removeFavorite(String templateId) async {
    final favorites = await loadFavorites();
    favorites.remove(templateId);
    return await saveFavorites(favorites);
  }

  /// Check if a template is favorited
  static Future<bool> isFavorite(String templateId) async {
    final favorites = await loadFavorites();
    return favorites.contains(templateId);
  }

  /// Clear all favorites (useful for testing)
  static Future<bool> clearAllFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_storageKey);
    } catch (e) {
      print('Error clearing favorites: $e');
      return false;
    }
  }
}
