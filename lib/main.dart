import 'package:adivinarnumero_desafio/services/game_programaing.dart';
import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Game(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  //const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
