import 'package:flixxer/frontend/helpers/MovieWidget.dart';
import 'package:http/http.dart' as http;
import '../../index.dart';

class movieList extends StatefulWidget {
  @override
  _movieListState createState() => _movieListState();
}

class _movieListState extends State<movieList> {
  List children = listMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text('ListViexw')),
            body: Center(
              child: ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int position) {
                      return children[position];
              },
              ),
            )
                  );
  }

  static List listMovies() {
    final movieObjectList = <Widget>[];
    var _apiUrl = "https://api.themoviedb.org/3/discover/movie?api_key=b7a228798b28e5a67b5c2d47647d108a";
    http
        .get(
        _apiUrl)
        .then((resp) {
      List<dynamic> results = json.decode(resp.body)['results'];
      results.forEach((element) {
        Movie m = Movie.fromJson(element);
        movieObjectList.add(MovieWidget(m));
        print(m);
      });
    });
    return movieObjectList;
  }
}

