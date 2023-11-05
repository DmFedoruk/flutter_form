import 'package:flutter/material.dart';
import 'package:scoped_model_second/screens/home_cupertino.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: //HomeMaterial(),
            HomeCupertino());
  }
}
