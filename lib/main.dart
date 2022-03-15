import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPost(int pokemonId) async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Pokemon {
  final String name;
  final int order;

  Pokemon({
    required this.name,
    required this.order
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      order: json['order'],
    );
  }
}

void main() {
  runApp(MyApp(pokemon: fetchPost(400)));
}

class MyApp extends StatelessWidget {
  final Future<Pokemon> pokemon;

  const MyApp({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo UDG',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catálogo UDG'),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                  'Bienvenido',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                  )
              ),
              const Text(
                'Catálogo UDG',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              FutureBuilder<Pokemon>(
                  future: pokemon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.name);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CircularProgressIndicator();
                  }
              )
            ],
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover
            ),
          ),
        )
      ),
    );
  }
}
