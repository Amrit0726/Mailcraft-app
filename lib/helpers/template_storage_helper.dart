import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper class to save and load custom templates from local storage
class TemplateStorageHelper {
  static const String _storageKey = 'custom_templates';

  /// Save templates to local storage
  static Future<bool> saveTemplates(List<Map<String, dynamic>> templates) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(templates);
      return await prefs.setString(_storageKey, jsonString);
    } catch (e) {
      print('Error saving templates: $e');
      return false;
    }
  }

  /// Load templates from local storage
  static Future<List<Map<String, dynamic>>> loadTemplates() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_storageKey);
      
      if (jsonString == null || jsonString.isEmpty) {
        return []; // No saved templates
      }
      
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      print('Error loading templates: $e');
      return [];
    }
  }

  /// Clear all saved templates (useful for testing)
  static Future<bool> clearAllTemplates() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_storageKey);
    } catch (e) {
      print('Error clearing templates: $e');
      return false;
    }
  }
}
