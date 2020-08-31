import 'dart:ui';

import '../../index.dart';
import 'dart:ui' as ui;

class MovieDetalleScreen extends StatelessWidget {
  final Movie movie;

  MovieDetalleScreen(this.movie);

  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(fit: StackFit.expand, children: [
      new Image.network(movie.image_url, fit: BoxFit.cover),
      new BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 7),
        child: new Container(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RawMaterialButton(
              onPressed: () {
                print('pressedddd"');
              },
              elevation: 2.0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: SizeConfig.screenHeight * 0.04,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('pressed');
                },
              ),
              shape: CircleBorder(),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.6,
              child: Text(
                movie.title,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.screenHeight * 0.03),
              ),
            ),
            GestureDetector(
                onTap: () => print("2"),
                child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: const Icon(Icons.favorite_border))),
          ],
        ),
      ),
      new Container(
          margin: EdgeInsets.only(
              top: SizeConfig.screenHeight * 0.2,
              bottom: SizeConfig.screenHeight * 0.1,
              left: SizeConfig.screenWidth * 0.25,
              right: SizeConfig.screenWidth * 0.25),
          child: new Column(children: <Widget>[
            new Container(
              alignment: Alignment.center,
              child: new Container(
                height: SizeConfig.screenHeight * 0.4,
              ),
              decoration: new BoxDecoration(
                borderRadius:
                    new BorderRadius.circular(SizeConfig.screenHeight * 0.05),
                image: new DecorationImage(
                    image: new NetworkImage(movie.image_url),
                    fit: BoxFit.contain),
              ),
            ),
          ])),
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.1,
              SizeConfig.screenHeight * 0.7, SizeConfig.screenWidth * 0.1, 0),
          child: Text(
            movie.overview,
            style: TextStyle(
                color: Colors.white, fontSize: SizeConfig.screenHeight * 0.02),
          ),
        ),
      )
    ]));
  }
}
