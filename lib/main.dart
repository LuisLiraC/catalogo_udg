import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
