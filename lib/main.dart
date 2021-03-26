import 'package:flutter/material.dart';
import 'package:flutter_disenos/pages/ejercicio_2/cuadrado_ejemplos_home.dart';
import 'package:flutter_disenos/pages/ejercicio_1/headers.dart';
import 'package:flutter_disenos/pages/ejercicio_3/progress_indicator_simple.dart';
import 'package:flutter_disenos/pages/ejercicio_3/progress_indicator_home..dart';
import 'package:flutter_disenos/pages/ejercicio_4/sliver_show.dart';
import 'package:flutter_disenos/pages/home_page.dart';
import 'package:flutter_disenos/provider/page_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Custom Painter',
        initialRoute: 'sliverShow',
        routes: {
          '/'                   : (_) => HomePage(),
          'header'              : (_) => HeaderPage(),
          'cuadradoAnimado'     : (_) => CuadradoHomePage(),
          'progresIndicatorHome': (_) => CustomProgressIndicatorHomePage(),
          'progresIndicator'    : (_) => CustomProgressIndicator(),
          'sliverShow'          : (_) => SliverShowPage(),
        },
      ),
    );
  }
}
