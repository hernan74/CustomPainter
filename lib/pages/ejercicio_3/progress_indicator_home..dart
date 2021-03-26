import 'package:flutter/material.dart';
import 'package:flutter_disenos/pages/ejercicio_3/graficas_circulares_page.dart';
import 'package:flutter_disenos/pages/ejercicio_3/progress_indicator_retroceso_animado.dart';
import 'package:flutter_disenos/pages/ejercicio_3/progress_indicator_simple.dart';
import 'package:flutter_disenos/pages/ejercicio_3/texto_animado.dart';

class CustomProgressIndicatorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        CustomProgressIndicator(),
        CustomProgressIndicatorConRetrosesoAnimado(),
        TextAnimadoPage(),
        GraficasCircularesPage()
      ],
    );
  }
}
