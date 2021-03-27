import 'package:flutter/material.dart';
import 'package:flutter_disenos/widgets/headers_widget.dart';
import 'package:flutter_disenos/widgets/slider_show_widget.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliderShowCustom(
      tipoDot: DotTipo.Numero,
      slides: [
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
    );
  }
}
