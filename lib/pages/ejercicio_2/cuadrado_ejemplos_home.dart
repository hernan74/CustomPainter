import 'package:flutter/material.dart';
import 'package:flutter_disenos/pages/ejercicio_2/cuadrado_mover.dart';
import 'package:flutter_disenos/pages/ejercicio_2/cuadrado_mover_desvanecer.dart';
import 'package:flutter_disenos/pages/ejercicio_2/figura_aleatoria.dart';

class CuadradoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [AnimacionPage(), CuadradoAnimadoPage(), FiguraAleatoriaPage()],
    );
  }
}
