import 'dart:convert';

import 'package:http/http.dart' as http;

class Movie {
  bool adult;
  int budget;
  var genres; //This will be a list of genres
  int id;
  String overview;
  double popularity;
  String release_date;
  String title;
  double vote_average;
  int vote_count;

  Movie(
      this.adult,
      this.budget,
      this.genres,
      this.id,
      this.overview,
      this.popularity,
      this.release_date,
      this.title,
      this.vote_average,
      this.vote_count);

  Movie.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        budget = json['budget'],
        genres = json['genres'],
        id = json['id'],
        overview = json['overview'],
        popularity = json['popularity'],
        release_date = json['release_date'],
        title = json['title'],
        vote_average = json['vote_average'].toDouble(),
        vote_count = json['vote_count'];
}

void main() {
  http
      .get(
          "https://api.themoviedb.org/3/discover/movie?api_key=b7a228798b28e5a67b5c2d47647d108a")
      .then((resp) {
    List<dynamic> results = json.decode(resp.body)['results'];
    results.forEach((element) {
      Movie m = Movie.fromJson(element);
      print(m.genres);
    });
  });
}

class Genre {
  int id;
  String name;
}
