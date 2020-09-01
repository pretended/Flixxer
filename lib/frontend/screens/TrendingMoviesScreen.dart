import 'package:flixxer/frontend/Models/API.dart';
import 'package:flixxer/frontend/helpers/MovieWidget.dart';
import 'package:flixxer/frontend/screens/OverviewScreen.dart';
import 'package:flixxer/frontend/tests/test.dart';

import '../../index.dart';
import 'package:http/http.dart' as http;
class TrendingMoviesScreen extends StatefulWidget {
  List children = <Widget>[];

  @override
  _TrendingMoviesScreenState createState() => _TrendingMoviesScreenState();
}

class _TrendingMoviesScreenState extends State <TrendingMoviesScreen> {
  List children = <Widget>[];
  _TrendingMoviesScreenState() {
    getTrendingIds().then((val) => setState(() {
      children = val;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.05,
                  bottom: SizeConfig.screenHeight * 0.03,
                  left: SizeConfig.screenWidth * 0.07, right: SizeConfig.screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: SizeConfig.screenWidth * 0.06
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, size: SizeConfig.screenHeight * 0.035,),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Movies",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: SizeConfig.screenWidth * 0.05
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.05),
                    child: Text("See trending",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.redAccent,
                            fontSize:  SizeConfig.screenWidth * 0.035
                        )),
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01,),
            Expanded(
                child: buildTrendingList()
            )
          ],
        )
    );
  }
  Future<List> listTrendingMovies() async {
    final movieObjectList = <Widget>[];
    List<int> trendingMoviesIds = await getTrendingIds();
    trendingMoviesIds.forEach((element) async {
      Movie m = await getMovieById(element);
      movieObjectList.add(MovieWidget(m));
      print(m.image_url);
    });
    return movieObjectList;
  }
  ListView buildTrendingList () {
    Movie tapped;
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (BuildContext context, int position) {
        return ListTile(
          title: children[position],
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.keyboard_arrow_right, color:Colors.grey, size: SizeConfig.screenHeight * 0.05,),
            ],
          ),
          onTap: () {
            tapped = children[position].getMovie();
            Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewScreen(tapped)));
          },
        );
      },
    );
  }

  Future<List<int>> getTrendingIds()  async {
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
