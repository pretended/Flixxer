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
  String image_url;
  static String _imageApiUrl = 'https://image.tmdb.org/t/p/w300_and_h450_bestv2/';

  Movie({this.adult,
      this.budget,
      this.genres,
      this.id,
      this.overview,
      this.popularity,
      this.release_date,
      this.title,
      this.vote_average,
      this.vote_count,
      this.image_url});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        adult: json['adult'],
        budget : json['budget'],
        genres : json['genres'],
        id : json['id'],
        overview : json['overview'],
        popularity : json['popularity'],
        release_date : json['release_date'],
        title : json['title'],
        vote_average : json['vote_average'].toDouble(),
        vote_count : json['vote_count'],
        image_url : _imageApiUrl + json['poster_path'].toString().substring(1)
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['budget'] = this.budget;
    data['genres'] = this.genres;
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['release_date'] = this.release_date;
    data['title'] = this.title;
    data['vote_average'] = this.vote_average;
    data['vote_count'] = this.vote_count;
    data['image_url'] = this.image_url;
    return data;
  }
}

class Genre {
  int id;
  String name;
}
