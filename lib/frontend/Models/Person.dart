import 'package:flixxer/frontend/Models/API.dart';
import 'package:flixxer/index.dart';
import 'package:http/http.dart' as http;


class Person {
  int id;
  String name;
  int gender;
  String profile_path;
  
  //This ones are specific when full profile is loaded
  String birthday;
  String know_for_department;
  String deathday;
  String biography;
  double popularity;
  String place_of_birth;
  String homepage;


  Person.fromJSON(Map<String, dynamic> json)
      :
        birthday = json['birthday'],
        know_for_department = json['know_for_department'],
        deathday = json['deathday'],
        id = json['id'],
        name = json['name'],
        gender = json['gender'],
        biography = json['biography'],
        popularity = json['popularity'].toDouble(),
        place_of_birth = json['place_of_birth'],
        profile_path = json['profile_path'],
        homepage = json['homepage'];

  Person.fromJSONinCastandCrew(Map<String, dynamic> json)
      :
        name = json['name'],
        id = json['id'],
        profile_path = json['profile_path'],
        gender = json['gender'];
  
  
  Future<Person> loadFullProfile() async{
    Map<String, dynamic> result = json.decode((await http.get("${API.API_URL}/person/${this.id}?api_key=${API.API_KEY}")).body);
    this.birthday = result['birthday'];
    this.know_for_department = result['know_for_department'];
    this.deathday = result['deathday'];
    this.biography = result['biography'];
    this.popularity = result['popularity'].toDouble();
    this.place_of_birth = result['place_of_birth'];
    this.homepage = result['homepage'];
    return this;
  }
}