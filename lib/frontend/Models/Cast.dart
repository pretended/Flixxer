import 'package:flixxer/frontend/Models/Person.dart';

class Cast extends Person {
  String character;
  int cast_id;
  String credit_id;
  int order;

  Cast.fromJSON(Map<String, dynamic> json)
      : cast_id = json['cast_id'],
        character = json['character'],
        credit_id = json['credit_id'],
        order = json['order'],
        super.fromJSONinCastandCrew(json);
}