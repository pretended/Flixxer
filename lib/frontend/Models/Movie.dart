import 'dart:convert';
import 'package:flixxer/frontend/Models/Cast.dart';
import 'package:flixxer/frontend/Models/Crew.dart';
import 'package:flixxer/frontend/Models/Person.dart';
import 'package:flixxer/frontend/tests/test.dart';
import 'package:flixxer/index.dart';
import 'package:http/http.dart' as http;
import 'API.dart';
class Movie {
  bool adult;
  int budget;
  var genres; // Can be an array of genres
  var production_companies; // Can be an array companies
  var production_countries; // Can be array
  var spoken_languages; // Can be array
  String homepage;
  String imdb_id;
  String original_language;
  String original_title;
  int revenue;
  int runtime;
  String status;
  String tagline;
  bool video;
  int id;
  String overview;
  double popularity;
  String release_date;
  String title;
  double vote_average;
  int vote_count;
  String image_url;
  String origin_country;
  String languageOutput = "en-US";
  List<Person> cast = new List();
  List<Person> crew = new List();
  static String _imageApiUrl =
      'https://image.tmdb.org/t/p/w500';

  Movie(
      {this.adult, this.image_url, this.budget, this.genres, this.homepage, this.id, this.imdb_id, this.original_language,
        this.original_title, this.overview, this.popularity, this.production_companies, this.production_countries, this.release_date,
        this.revenue, this.runtime, this.spoken_languages, this.status, this.tagline, this.title, this.video, this.vote_average, this.vote_count, this.languageOutput});

  Movie.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        budget = json['budget'],
        genres = json['genres'],
        production_countries = json['production_countries'],
        production_companies = json['production_companies'],
        spoken_languages = json['spoken_languages'],
        homepage = json['homepage'],
        imdb_id = json['imdb_id'],
        id = json['id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        revenue = json['revenue'],
        runtime = json['runtime'],
        status = json['status'],
        tagline = json['tagline'],
        video = json['video'],
        overview = json['overview'],
        popularity = json['popularity'],
        release_date = json['release_date'],
        title = json['title'],
        vote_average = json['vote_average'].toDouble(),
        vote_count = json['vote_count'],
        image_url = _imageApiUrl + json['poster_path'];


  //Puebla las listas cast y crew
  Future<List<Person>> getCredits() async {
    print("${API.API_URL}/movie/${this.id}/credits?api_key=${API.API_KEY}");
    var response = json.decode((await http.get(
        "${API.API_URL}movie/${this.id}/credits?api_key=${API.API_KEY}")).body);
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
  Future<List<int>> getTrendingIds () async {
    List<int> moviesIds = new List<int>();
    var _trendingApiUrl = "https://api.themoviedb.org/3/trending/all/day?api_key=${API.API_KEY}";
    http.Response resp = await http.get(_trendingApiUrl);
    List<dynamic> response = jsonDecode(resp.body)['results'];
    response.forEach((element) {
      MovieDetailed movieDetailed = MovieDetailed.fromJson(element);
      moviesIds.add(movieDetailed.id);
    });
    return moviesIds;
  }
  Future<Movie> getMovieById(int id) async {
    var _getDetailsApiUrl = "https://api.themoviedb.org/3/movie/${id.toString()}?api_key=${API.API_KEY}";
    http.Response response = await http.get(_getDetailsApiUrl);
    Map<String,dynamic> movie =  jsonDecode(response.body);
    return Movie.fromJson(movie);
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
class ProductionCompanies {
  int id;
  String logo_path;
  String name;
  String origin_country;
  ProductionCompanies(this.id, this.logo_path, this.name, this.origin_country);
}
class ProductionCountries {
  String name;
  ProductionCountries(this.name);
}
class SpokenLanguagues {
  String name;
  SpokenLanguagues(this.name);
}