import 'package:flutter/material.dart';
import 'package:flutter_disenos/widgets/circular_indicator.dart';

class CustomProgressIndicatorConRetrosesoAnimado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1'),
      ),
      body: BarraProgresoAnimado(
        progresoMaximo: 100.0,
        progresoInverso: 100.0,
        colorLineaPrincipal: Colors.blue,
      ),
    );
  }
}
