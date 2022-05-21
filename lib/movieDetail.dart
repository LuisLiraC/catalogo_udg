import 'package:catalogo_udg/movieModel.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  Movie movie;

  MovieDetail(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold (
          appBar: AppBar (
            title: Text(movie.title),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                movie.thumbnail,
                height: 200,
              ),
              Text(movie.title),
              Text(movie.year),
              Text(movie.gender),
              Text(movie.director),
              Text(movie.synopsis),
            ],
          ),
        ),
      )
    );
  }
}