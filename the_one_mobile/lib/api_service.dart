import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/movie.dart';

class ApiService {
  final String baseUrl = 'http://10.139.104.190:8000';
  

  Future<List<Movie>> getMovie({String vibe = "random"}) async {
    final response = await http.get(Uri.parse('$baseUrl/recommend/vibes?vibes=$vibe'));
    if (response.statusCode == 200) {
      return List<Movie>.from(jsonDecode(response.body).map((x) => Movie.fromJson(x)));
    }
    else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)['detail']);
    }
    else {
      throw Exception('Failed to load movie');
    }
  }

  Future<void> discardMovie(String movieId) async {
    final response = await http.post(Uri.parse('$baseUrl/discard/$movieId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to discard movie');
    }
  }

  Future<List<dynamic>> getDiscardedMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/discarded/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load discarded movies');
    }
  }

  Future<void> undiscardMovie(String movieId) async {
    final response = await http.delete(Uri.parse('$baseUrl/discard/$movieId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to undiscard movie');
    }
  }
}

