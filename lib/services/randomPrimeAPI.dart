import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RandomPrimeAPI {
  static const _url = 'http://www.randomnumberapi.com/api/v1.0/random';

  static Future<int?> fetchRandomNumber() async {
    try {
      final uri = Uri.parse(_url);
      final response = await http.get(uri).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is List && data.isNotEmpty && data.first is int) {
          return data.first as int;
        } else {
          _logError('Unexpected response format: $data');
        }
      } else {
        _logError('Request failed with status: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      _logError('ClientException: ${e.message}');
    } on TimeoutException {
      _logError('Request timed out.');
    } on FormatException catch (e) {
      _logError('FormatException: ${e.message}');
    } catch (e) {
      _logError('Unexpected error: $e');
    }
    return null;
  }

  static void _logError(String message) {
    print('[RandomPrimeAPI] $message');
  }
}
