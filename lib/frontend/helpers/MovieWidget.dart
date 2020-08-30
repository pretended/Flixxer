import 'package:flixxer/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class MovieWidget extends StatelessWidget {
  Movie flix;
  MovieWidget(Movie fl) {
    flix = fl;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return
      Padding(
        padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.025,bottom: SizeConfig.screenHeight*0.025),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: SizeConfig.screenWidth*0.45/2,
                  height: SizeConfig.screenHeight*0.3/2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          flix.image_url,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(SizeConfig.screenWidth*0.05)
                  ),
                )
              ],
            ),
            SizedBox(width: SizeConfig.screenWidth*0.05),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    flix.title,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth *0.038),
                  ),
                  SizedBox(height: SizeConfig.screenHeight*0.01,),
                  Text(
                    flix.release_date,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: SizeConfig.screenWidth *0.027,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight*0.01,),
                  Text(
                    'Popularity: ' + flix.popularity.toString(),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: SizeConfig.screenWidth *0.027,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight*0.005,),
                  getStars(flix.vote_average),
                ],
              ),
            ),

          ],
        ),
      );
  }
}