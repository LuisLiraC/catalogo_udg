import 'package:catalogo_udg/home.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_udg/movieModel.dart';
import 'package:catalogo_udg/moviesRepository.dart';

class AddMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agregar Película',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Película'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddMovieForm(),
            )
          ],
        ),
      ),
    );
  }
}

class AddMovieForm extends StatefulWidget {
  AddMovieForm({Key? key}) : super(key: key);

  @override
  _AddMovieFormState createState() => _AddMovieFormState();
}

class _AddMovieFormState extends State<AddMovieForm> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? year;
  String? director;
  String? gender;
  String? synopsis;
  String? thumbnail;

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );
    var space = SizedBox(height: 10);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.text_fields),
                labelText: 'Título',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter title';
              }
              return null;
            },
            onSaved: (val) {
              title = val;
            },
          ),

          space,

          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.text_fields),
                labelText: 'Año',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter year';
              }
              return null;
            },
            onSaved: (val) {
              year = val;
            },
          ),

          space,
          // name
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Director',
              prefixIcon: Icon(Icons.account_circle),
              border: border,
            ),
            onSaved: (val) {
              director = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter director name';
              }
              return null;
            },
          ),

          space,

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Género',
              prefixIcon: Icon(Icons.text_fields),
              border: border,
            ),
            onSaved: (val) {
              gender = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter gender';
              }
              return null;
            },
          ),

          space,

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Sinopsis',
              prefixIcon: Icon(Icons.text_fields),
              border: border,
            ),
            onSaved: (val) {
              synopsis = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter synopsis';
              }
              return null;
            },
          ),

          space,

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Link de portada',
              prefixIcon: Icon(Icons.link_outlined),
              border: border,
            ),
            onSaved: (val) {
              thumbnail = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter thumbnail link';
              }
              return null;
            },
          ),

          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
                var movie = MovieDTO(title, year, gender, director, synopsis, thumbnail);
                MoviesRepository().createMovie(movie);

                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home())
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: Text('Guardar'),
            ),
          )

        ],
      ),
    );
  }
}
