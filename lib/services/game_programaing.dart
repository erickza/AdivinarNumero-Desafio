import 'dart:math';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  int? _numeroCorrecto;
  int? _numeroMaximo;
  int? _numeroIntentos;

  void startGame(double dificultad) {
    if (dificultad == 1) {
      _numeroCorrecto = Random().nextInt(10) + 1;
      _numeroMaximo = 5;
    } else if (dificultad == 2) {
      _numeroCorrecto = Random().nextInt(20) + 1;
      _numeroMaximo = 8;
    } else if (dificultad == 3) {
      _numeroCorrecto = Random().nextInt(100) + 1;
      _numeroMaximo = 15;
    } else {
      _numeroCorrecto = Random().nextInt(1000) + 1;
      _numeroMaximo = 25;
    }

    _numeroIntentos = _numeroMaximo;
  }

  String verificacionNum(int numero) {
    _numeroIntentos!;
    if (numero == _numeroCorrecto) {
      resetGame();
      return "¡Felicidades! Has adivinado el número.";
    } else if (numero < _numeroCorrecto!) {
      return "El número es mayor.";
    } else {
      return "El número es menor.";
    }
  }

  void resetGame() {
    _numeroCorrecto = null;
    _numeroMaximo = null;
    _numeroIntentos = null;
  }

  int? get numeroIntentos => _numeroIntentos;
}
