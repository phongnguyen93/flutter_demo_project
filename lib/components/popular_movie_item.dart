import 'package:flutter/material.dart';
import 'package:flutter_demo_project/constants/configs.dart';
import 'package:flutter_demo_project/models/popular_movie.dart';

var nameStyle = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    height: 3,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    fontFamily: "Oswald");

var symbolStyle = const TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.w200,
    fontFamily: "Oswald");

var priceStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    height: 3,
    fontWeight: FontWeight.w200,
    fontFamily: "Oswald");

TextStyle percentStyle(double percent) {
  if (percent < 0) {
    return const TextStyle(
        color: Color.fromRGBO(248, 115, 115, 1.00),
        fontSize: 14,
        letterSpacing: 1.1,
        fontWeight: FontWeight.w200,
        fontFamily: "Oswald");
  }
  return const TextStyle(
      color: Color.fromRGBO(173, 115, 248, 1.00),
      fontSize: 14,
      fontWeight: FontWeight.w200,
      fontFamily: "Oswald");
}

class PopularMovieItem extends StatelessWidget {
  final PopularMovie movie;

  PopularMovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Image.network("${MovieDBService.imageUrl}/w92/${movie.backdropPath}"),
          Text(
            movie.title!.toUpperCase(),
            style: nameStyle,
          )
        ]));
  }
}
