import 'package:flixxer/frontend/helpers/getStars.dart';
import 'package:flixxer/index.dart';

import 'package:google_fonts/google_fonts.dart';

class Movie extends StatelessWidget {
  final int movieId;
  var minAge;
  var movieType;
  int movieLong;
  double rate;
  final movieName;
  // ignore: non_constant_identifier_names
  var image_url;

  Movie(this.movieName, this.image_url, this.movieType, this.minAge, this.movieLong, this.rate, {this.movieId});
  @override
  Widget build(BuildContext context) {

    SizeConfig.init(context);
    return Scaffold(
      body: Row(
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
                      '$image_url',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(SizeConfig.screenWidth*0.05)
                ),
              )
            ],
          ),
          SizedBox(width: SizeConfig.screenWidth*0.05,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight*0.1),
              Text(
                "$movieName",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,

                    fontSize: 18),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.01,),
              Text(
                "$movieType | $movieLong min",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.01,),
              Text(
                "$minAge",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.005,),
              getStars(this.rate),
            ],
          )
        ],
      )
    );
  }
}