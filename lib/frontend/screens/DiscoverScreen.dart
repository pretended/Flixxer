import 'package:flixxer/frontend/helpers/MovieWidget.dart';

import 'package:http/http.dart' as http;
import 'package:flixxer/index.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List children = listMovies();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Popular Movies",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: SizeConfig.screenWidth * 0.05
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01,),
            Expanded(
              child: buildDiscoverList()
            )
          ],
        )
    );
  }
  ListView buildDiscoverList () {
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
          onTap: () {},
        );
      },
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
      });
    });
    return movieObjectList;
  }
}
