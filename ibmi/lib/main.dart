import 'package:flutter/cupertino.dart';
import 'package:imbi/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "IMBI",
      routes: {
        '/': (BuildContext context) => MainPage(),
      },
      initialRoute: '/',
    );
  }
}
