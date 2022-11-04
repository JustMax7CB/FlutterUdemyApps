import 'package:flutter/material.dart';
import 'package:frivia_udemy_app/pages/game_page.dart';
import 'package:frivia_udemy_app/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/menu',
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: 'GemunuLibre',
        scaffoldBackgroundColor: const Color.fromRGBO(
          31,
          31,
          31,
          1.0,
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/menu': (context) => Menu(),
        '/game': (context) => GamePage(),
      },
    );
  }
}
