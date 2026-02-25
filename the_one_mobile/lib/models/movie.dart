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
  String plot;
  String type;
  String runtime;
  String totalseason;

  MovieDetails({required this.title, required this.year, required this.posterUrl, required this.plot, required this.type, required this.runtime, required this.totalseason});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json['Title'],
      year: json['Year'],
      posterUrl: json['Poster'],
      plot: json['Plot'] ?? "No plot available",
      type: json['Type'] ?? "N/A",
      runtime: json['Runtime'] ?? "N/A",
      totalseason: json['totalSeasons'] ?? "N/A",
    );
  }
}