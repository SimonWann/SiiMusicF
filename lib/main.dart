import 'package:flutter/material.dart';
import 'package:sii_music/Page/RightContainer.dart';
import 'package:sii_music/Route.dart';
import 'package:sii_music/Page/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "SiiMusic",
      home: Scaffold(
        body: SiiRoute(

        ),
      )
    );
  }
}
