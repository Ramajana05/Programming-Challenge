import 'package:shared_preferences/shared_preferences.dart';

class TimeTillLastPrime {
  static const String _key = 'lastPrimeTime';

  static Future<void> saveLastPrimeTime(DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, time.toIso8601String());
  }

  static Future<DateTime?> loadLastPrimeTime() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored != null) {
      return DateTime.tryParse(stored);
    }
    return null;
  }
}
