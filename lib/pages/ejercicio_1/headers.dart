import 'package:flutter/material.dart';
import 'package:flutter_disenos/widgets/headers_widget.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          HeaderCuadrado(),
          HeaderConBordeCircular(),
          HeaderDiagonal(),
          HeaderTriangular(),
          HeaderTriangularCurvo(),
          HeaderConPico(),
          HeaderCurvo(),
          HeaderWave(),
          HeaderWaveGradiente(),
          HeaderWaveInvertido()
        ],
      ),
    );
  }
}
