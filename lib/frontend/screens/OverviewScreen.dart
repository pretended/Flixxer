import 'dart:ui';

import '../../index.dart';

class OverviewScreen extends StatefulWidget {
  Movie movie;
  OverviewScreen(this.movie);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();


}

class _OverviewScreenState extends State<OverviewScreen> {
  IconData favoriteIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text(widget.movie.title, style: TextStyle(
                        color: Colors.white,
                        fontSize:SizeConfig.screenHeight * 0.035 ),),
                    backgroundColor: Colors.transparent,
                    expandedHeight: 500,
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(Icons.keyboard_backspace,color: Colors.white,), onPressed: () {Navigator.pop(context);  },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: blurImage(widget.movie.image_url),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(favoriteIcon, color: Colors.red,  ),
                        padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.03),
                        onPressed: () {
                          setState(() {
                            if (favoriteIcon == Icons.favorite_border) {
                              favoriteIcon = Icons.favorite;
                            } else {
                              favoriteIcon = Icons.favorite_border;
                            }
                          });
                        },
                      )
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        movieDetails(widget.movie)
                      ]
                    ),

                  )
                ],
                
              )

          )
      );
  }
Widget movieDetails(Movie movie){
    TextStyle infoStyle = TextStyle(
        fontSize: SizeConfig.screenHeight * 0.02,
        fontWeight: FontWeight.w900,
    );
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: SizeConfig.screenWidth * 0.01,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight *0.03),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.03,),

        Text("Information",
            style:infoStyle),
        SizedBox(height: SizeConfig.screenHeight * 0.05,),
        Padding(
          padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.08, left: SizeConfig.screenWidth * 0.08),
          child: Text(
              movie.title,
              style: TextStyle(
                fontSize: SizeConfig.screenHeight * 0.03,
                fontWeight: FontWeight.w900
              )
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.03,),
        getStars(widget.movie.vote_average,true),
        SizedBox(height: SizeConfig.screenHeight * 0.03,),
        Padding(
          padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.1, left: SizeConfig.screenWidth * 0.1),
          child: Text("Movie Plot",style: TextStyle(
          fontSize: SizeConfig.screenHeight * 0.024,
              fontWeight: FontWeight.w800
          )),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02,),
        Padding(
          padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.13, left: SizeConfig.screenWidth * 0.13),
          child: Text(widget.movie.overview, style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.018,
              fontWeight: FontWeight.w200
          )),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04,),

      ],
      )
      );
}
  Widget _infoPanel (String movieTitle, String movieOverview, double movieRated ) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 0.4,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
                child: Container(
                    child: Text(movieTitle)
                ),
          );
        });
  }
  Container blurImage(String imageUrl)
  {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}
