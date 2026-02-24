class Movie {
  String id;
  MovieDetails details;

  Movie({required this.id, required this.details});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['movie_id'], 
      details: MovieDetails.fromJson(json['movie_details'])
    );
  }

}

class MovieDetails {
  String title;
  String year;
  String posterUrl;

  MovieDetails({required this.title, required this.year, required this.posterUrl});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json['Title'],
      year: json['Year'],
      posterUrl: json['Poster'],
    );
  }
}