import 'dart:math';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  double valorSlider = 0;

  int? _numeroCorrecto;
  int? _numeroMaximo;
  int? _numeroIntentos;

  void setDificult(double value) {
    valorSlider = value;
    startGame();
    notifyListeners();
  }

  void startGame() {
    if (valorSlider == 0) {
      _numeroCorrecto = Random().nextInt(10) + 1;
      _numeroMaximo = 5;
    } else if (valorSlider == 2) {
      _numeroCorrecto = Random().nextInt(20) + 1;
      _numeroMaximo = 8;
    } else if (valorSlider == 3) {
      _numeroCorrecto = Random().nextInt(100) + 1;
      _numeroMaximo = 15;
    } else {
      _numeroCorrecto = Random().nextInt(1000) + 1;
      _numeroMaximo = 25;
    }

    _numeroIntentos = _numeroMaximo;
  }

  String verificacionNum(int numero) {
    if (_numeroIntentos != null) {
      _numeroIntentos = _numeroIntentos! - 1;
    }
    if (numero == _numeroCorrecto) {
      resetGame();
      return "$numero";
    } else if (numero < _numeroCorrecto!) {
      return "$numero.";
    } else {
      return "$numero";
    }
  }

  void resetGame() {
    _numeroCorrecto = null;
    _numeroMaximo = null;
    _numeroIntentos = null;
  }

  int? get numeroIntentos => _numeroIntentos;
}
