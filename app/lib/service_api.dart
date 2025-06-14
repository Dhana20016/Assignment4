import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'http://localhost:5000/api/lessons';

  static Future<List<String>> getLessons() async {
    final res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return List<String>.from(data);
    } else {
      throw Exception('Failed to load lessons');
    }
  }

  static Future<void> addLesson(String title) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'title': title}),
    );

    if (res.statusCode != 201) {
      throw Exception('Failed to add lesson');
    }
  }
}
