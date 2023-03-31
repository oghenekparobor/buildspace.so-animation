import 'package:buildspace/src/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();
final size = MediaQuery.of(navKey.currentContext!).size;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Build Space',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
      navigatorKey: navKey,
    );
  }
}
