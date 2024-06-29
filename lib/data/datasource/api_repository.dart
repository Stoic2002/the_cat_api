// lib/repositories/cat_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_cat_api/data/models/cat_model.dart';

class ApiRepository {
  final String _baseUrl = 'https://api.thecatapi.com/v1';

  Future<List<CatImage>> getRandomCatImages({int limit = 10}) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/images/search?limit=$limit'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => CatImage.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load cat images');
    }
  }
}
