import 'package:flutter/material.dart';
import 'package:catalogo_udg/authentication.dart';
import 'package:catalogo_udg/login.dart';
import 'package:catalogo_udg/movies.dart';
import 'package:catalogo_udg/newMovieForm.dart';
import 'package:catalogo_udg/moviesRepository.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const Text('Welcome :D'),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Movies())
                  );
                },
                child: Text('Lista de Películas'),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Movies())
                  );
                },
                child: Text('Mis Películas'),
              ),
            ),
            FutureBuilder(
                future: AuthenticationHelper().isAdmin(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == true) {
                    return SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AddMovie())
                          );
                        },
                        child: Text('Agregar Película'),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
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
    );
  }
}