import 'package:flutter/material.dart';
import 'package:flutter_disenos/pages/ejercicio_2/cuadrado_ejemplos_home.dart';
import 'package:flutter_disenos/pages/ejercicio_1/headers.dart';
import 'package:flutter_disenos/pages/ejercicio_3/progress_indicator_home..dart';
import 'package:flutter_disenos/provider/page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paginaProvider = Provider.of<PageProvider>(context);

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: paginaProvider.pageController,
        children: [
          HeaderPage(),
          CuadradoHomePage(),
          CustomProgressIndicatorHomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaProvider.pagina,
        onTap: (i) {
          //Cambia la pagina
          paginaProvider.paginaActual = i;
        },
        items: [
          BottomNavigationBarItem(
            label: 'Ejercicio 1',
            icon: Icon(Icons.stacked_line_chart_outlined),
          ),
          BottomNavigationBarItem(
              label: 'Ejercicio 2', icon: Icon(Icons.animation)),
          BottomNavigationBarItem(
              label: 'Ejercicio 3',
              icon: Icon(Icons.insert_chart_outlined_sharp))
        ],
      ),
    );
  }
}
