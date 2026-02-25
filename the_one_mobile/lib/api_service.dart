import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/movie.dart';

class ApiService {
  final String baseUrl = 'http://10.139.104.190:8000';

  Future<Movie> getMovie() async {
    final response = await http.get(Uri.parse('$baseUrl/recommend/vibes'));
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}

void main() async {
  final apiService = ApiService();
  final movie = await apiService.getMovie();
  print(movie.details.title);
}
