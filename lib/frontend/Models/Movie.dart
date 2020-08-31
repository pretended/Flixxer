import 'dart:convert';
import 'package:flixxer/frontend/Models/Cast.dart';
import 'package:flixxer/frontend/Models/Crew.dart';
import 'package:flixxer/frontend/Models/Person.dart';
import 'package:flixxer/index.dart';
import 'package:http/http.dart' as http;
import 'API.dart';
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
  List<Person> cast = new List();
  List<Person> crew = new List();
  static String _imageApiUrl =
      'https://image.tmdb.org/t/p/w500/';

  Movie(
      {this.adult,
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
        vote_count = json['vote_count'],
        image_url = _imageApiUrl + json['poster_path'].toString().substring(1);

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

  //Puebla las listas cast y crew
  Future<List<Person>> getCredits() async{
    print("${API.API_URL}/movie/${this.id}/credits?api_key=${API.API_KEY}");
    var response = json.decode((await http.get("${API.API_URL}movie/${this.id}/credits?api_key=${API.API_KEY}")).body);
    List<dynamic> cast = response['cast'];
    List<dynamic> crew = response['crew'];
    cast.forEach((element) {
      this.cast.add(Cast.fromJSON(element));
    });
    crew.forEach((element) {
      this.cast.add(Crew.fromJSON(element));
    });

    List<Person> result = new List();
    result.addAll(this.cast);
    result.addAll(this.crew);
    return result;
  }
}

void main() {
  print('hello');
  http
      .get(
      "${API.API_URL}discover/movie?api_key=${API.API_KEY}")
      .then((resp) {
    List<dynamic> results = json.decode(resp.body)['results'];
    Movie m = Movie.fromJson(results[3]);
    m.getCredits().then((value){
      print(value[0].name);
    });
  });
}

class Genre {
  int id;
  String name;
}