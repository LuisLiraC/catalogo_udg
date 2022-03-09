import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Column(
          children: [
            const Text('Hello World'),
            const Text('Muerte a PHP'),
            Row(
              children: const <Widget> [
                Text('Fila 1'),
                Text('Fila 2'),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                ),
                Container(
                  width: 70,
                  height: 70,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
