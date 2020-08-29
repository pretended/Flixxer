import '../../index.dart';

class getStars extends StatelessWidget {
  double rate;
  getStars(this.rate);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: SizeConfig.screenHeight * 0.05,
        width: SizeConfig.screenWidth * 0.31,
        child: Row(
          children: listStars(this.rate),
        )
      ),
    );
  }
  double numberOfStars(double rate) {
    if (rate >= 9.5 && rate <= 10) return 5;
    else if (rate < 10 && rate >= 9) return 4.5;
    else if (rate < 9 && rate >= 8) return 4;
    else if (rate < 8 && rate >= 7) return 3.5;
    else if (rate < 7 && rate >= 6) return 3;
    else if (rate < 6 && rate >= 5) return 2.5;
    else if (rate < 5 && rate >= 4) return 2;
    else if (rate < 4 && rate >= 3) return 1.5;
    else if (rate < 3 && rate >= 2) return 1;
    else if (rate < 2 && rate >= 1) return 0.5;
    else if (rate < 1 && rate >= 0) return 0;
    else return -1;
  }
  Icon fullStar () {
    return Icon(Icons.star, color: Colors.yellow[700]);
  }
  Icon emptyStar () {
    return Icon(Icons.star_border, color: Colors.yellow[700] );
  }
  Icon halfStar () {
        return Icon(Icons.star_half, color: Colors.yellow[700]);
  }
  List listStars(double rate) {
    final children = <Widget>[];
    double n = numberOfStars(rate);
    double fractionalPart = n % 1;
    double integralPart = n - fractionalPart;
    for (var i = 0; i < integralPart; i++) {
      children.add(fullStar());
    }
    if (children.length == 5)
      return children;
    else {
      if (fractionalPart > 0.4) {
        children.add(halfStar());
      } else
        children.add(emptyStar());
      while (children.length < 5) {
        print('XDDD');
        children.add(emptyStar());
      }
      return children;
    }
  }
}
