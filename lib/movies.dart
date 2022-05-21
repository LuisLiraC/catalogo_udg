import 'package:catalogo_udg/home.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_udg/authentication.dart';
import 'package:catalogo_udg/login.dart';
import 'package:catalogo_udg/moviesRepository.dart';
import 'package:catalogo_udg/movieModel.dart';


class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(

          child: Column(
            children: [
              FutureBuilder(
                future: MoviesRepository().getMovies(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var movies = snapshot.data as List<Movie>;
                  return Container(
                    height: 600,
                    width: double.infinity,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20.0),
                        itemCount: movies.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 25);
                        },
                        itemBuilder: (context, index) {
                          var m = movies[index];
                          return Column(
                            children: [
                              Text(m.title),
                              Text(m.year),
                              Row(
                                children: [
                                  SizedBox(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Ver detalles'),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  FutureBuilder(
                                    future: AuthenticationHelper().isAdmin(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData && snapshot.data == true) {
                                        return SizedBox(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Colors.red),
                                            ),
                                            onPressed: () {
                                              MoviesRepository().deleteMovie(m.id);
                                              Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (builder) => Home()),
                                              );
                                            },
                                            child: Text('Eliminar'),
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    }
                                  ),
                                ],
                              )
                            ],
                          );
                        }
                      )
                    );
                  }
                  return const Text('No hay películas');
                }
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AuthenticationHelper()
                .signOut()
                .then((_) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (contex) => Login()),
            ));
          },
          child: Icon(Icons.logout),
          tooltip: 'Logout',
        ),
      ),
    );
  }
}