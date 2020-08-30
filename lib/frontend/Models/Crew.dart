import 'package:flixxer/frontend/Models/Person.dart';

class Crew extends Person {
  String credit_id;
  String department;
  String job;

  Crew.fromJSON(Map<String, dynamic> json)
      : credit_id = json['credit_id'],
        department = json['department'],
        job = json['job'],
        super.fromJSONinCastandCrew(json);
//String name;
//String profile_path;
}
