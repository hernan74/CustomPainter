import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CuadradoAnimado();
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  bool parar = true;

  AnimationController controller;
  Animation<double> rotacion;

  Animation<double> opacidad;
  Animation<double> opacidadOut;

  Animation<double> moverDerecha;
  Animation<double> escala;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.easeInOut)));
    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeInOut)));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    escala = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        if (parar)
          controller.reset();
        else
          controller.repeat();
      } 
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo 1'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          child: _Rectangulo(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(moverDerecha.value, 0),
              child: Transform.rotate(
                  angle: rotacion.value,
                  child: Opacity(
                      opacity: opacidad.value,
                      child: Opacity(
                          opacity: opacidadOut.value,
                          child: Transform.scale(
                              scale: escala.value, child: child)))),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(parar ? Icons.play_arrow : Icons.pause),
        onPressed: () => setState(() {
          controller.forward();
          parar = !parar;
        }),
      ),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
