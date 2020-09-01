class MovieDetailed {
  int id;
  MovieDetailed({this.id});

  MovieDetailed.fromJson(Map<String, dynamic> json)
      : id = json['id'];
}