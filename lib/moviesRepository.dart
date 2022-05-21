import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalogo_udg/movieModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:catalogo_udg/movieModel.dart';

class MoviesRepository {
  final db = FirebaseFirestore.instance;

  void createMovie(MovieDTO movie) async {

    var newMovie = <String, dynamic> {
      'title': movie.title,
      'year': movie.year,
      'director': movie.director,
      'gender': movie.gender,
      'synopsis': movie.synopsis,
      'thumbnail': movie.thumbnail
    };

    await db.collection('movies').add(newMovie);
  }

  Future<List<Movie>> getMovies() async {
    var response = await db.collection('movies').get().then((response) => response.docs);
    List<Movie> movies = [];
    for (var m in response) {
        movies.add(Movie(
            m.id,
            m.data()['title'],
            m.data()['year'],
            m.data()['gender'],
            m.data()['director'],
            m.data()['synopsis'],
            m.data()['thumbnail']
        ));
    }
    return movies;
  }

  void deleteMovie(String movieId) {
    db.collection('movies')
        .doc(movieId)
        .get()
        .then((response) => response.reference.delete());
  }
}