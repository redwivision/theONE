import 'dart:convert';

class Movie {
  String id;
  Map<String, MovieDetails> movieDetails;

  Movie(this.id, this.movieDetails);

  factory Movie.fromJson(Map<String, dynamic> json) {
    var id = json['movie_id'];
    var listOfMovieDetails = json['movie_details'] as List;
    Map<String, MovieDetails> movieDetails = listOfMovieDetails.map((e) => MovieDetails.fromJson(e)).toMap();
    return Movie(id, movieDetails);
  }
}

class MovieDetails {
  String title;
  String year;
  String posterUrl;

  MovieDetails(this.title, this.year, this.posterUrl);

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(json['Title'], json['Year'], json['Poster']);
  }


}