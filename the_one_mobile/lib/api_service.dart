import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'models/movie.dart';

class ApiService {
  final String _baseUrl = 'http://127.0.0.1:8000/recommend/vibes';

  Future<void> fetchRecommendation() async {
    var address = Uri.parse(_baseUrl);
    var client = HttpClient();

    try {
      var request = await client.getUrl(address);
      var response = await request.close();

      var responseBody = await response.transform(utf8.decoder).join();

      var data = jsonDecode(responseBody);

      print("the server says: $data");

    } finally {
      client.close();
    }
  }


}
