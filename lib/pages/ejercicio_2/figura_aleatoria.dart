import 'dart:math' as math;

import 'package:flutter/material.dart';

class FiguraAleatoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _RectanguloAnimado();
  }
}

class _RectanguloAnimado extends StatefulWidget {
  @override
  __RectanguloAnimadoState createState() => __RectanguloAnimadoState();
}

class __RectanguloAnimadoState extends State<_RectanguloAnimado>
    with SingleTickerProviderStateMixin {
  bool parar = true;
  Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  AnimationController controller;

  Animation<double> girar;
  Animation<double> circulo;
  Animation<double> moverAbajo;
  Animation<double> moverDerecha;

  Animation<double> colorR;
  Animation<double> colorG;
  Animation<double> colorB;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));

    girar = Tween(begin: 0.0, end: 5 * math.pi).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInCubic)));

    circulo = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.5, curve: Curves.easeInCubic)));

    moverAbajo = Tween(begin: 0.0, end: size.height - 250).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.25, curve: Curves.easeInOutSine)));

    moverDerecha = Tween(begin: 0.0, end: size.width - 80).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.25, 0.50, curve: Curves.easeInOutSine)));

    //  ---------------------------Colores-----------------------------------------
    colorR = Tween(begin: 33.0, end: 247.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInCubic)));
    colorG = Tween(begin: 150.0, end: 13.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInCubic)));
    colorB = Tween(begin: 243.0, end: 42.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInCubic)));

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
        title: Text('Ejemplo 3'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: Offset(moverDerecha.value, moverAbajo.value),
            child: Transform.rotate(
                angle: girar.value,
                child: _Rectangulo(
                  bordes: circulo.value,
                  colorR: colorR.value.toInt(),
                  colorG: colorG.value.toInt(),
                  colorB: colorB.value.toInt(),
                )),
          );
        },
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
  final bordes;
  final colorR;
  final colorG;
  final colorB;
  _Rectangulo({this.bordes, this.colorR, this.colorG, this.colorB});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          color: Color.fromRGBO(colorR, colorG, colorB, 1),
          borderRadius: BorderRadius.circular(bordes)),
    );
  }
}
