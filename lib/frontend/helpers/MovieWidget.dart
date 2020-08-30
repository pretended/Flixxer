import 'package:flixxer/index.dart';
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
      Row(
         children: <Widget>[
          Column(children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight*0.06),
              Container(
                width: SizeConfig.screenWidth*0.30,
                height: SizeConfig.screenHeight*0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      '$flix.image_url',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(SizeConfig.screenWidth*0.05)
                ),
              )
            ],
          ),
          SizedBox(width: SizeConfig.screenWidth*0.05,),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight*0.1),
                Text(
                  "$flix.title",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,

                      fontSize: 18),
                ),
                SizedBox(height: SizeConfig.screenHeight*0.01,),
                Text(
                  "x",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight*0.01,),
                Text(
                  "x",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight*0.005,),
                getStars(9),
              ],
            ),
          )
        ],
    );
  }
}