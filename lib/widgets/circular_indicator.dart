import 'dart:math';

import 'package:flutter/material.dart';

class BarraProgresoAnimado extends StatefulWidget {
  final double progresoMaximo;
  final double progresoInverso;
  final Color colorLineaFondo;
  final Color colorLineaPrincipal;
  final int duracion;

  BarraProgresoAnimado(
      {this.progresoMaximo = 100.0,
      this.colorLineaFondo = Colors.black38,
      this.colorLineaPrincipal = Colors.redAccent,
      this.duracion = 2000,
      this.progresoInverso = 0.0});

  @override
  _BarraProgresoAnimadoState createState() => _BarraProgresoAnimadoState();
}

class _BarraProgresoAnimadoState extends State<BarraProgresoAnimado>
    with SingleTickerProviderStateMixin {
  bool parar = true;
  AnimationController controller;

  Animation<double> porcentajeCargar;
  Animation<double> porcentajeInverso;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duracion));
    porcentajeCargar = Tween(begin: 0.0, end: widget.progresoMaximo).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.5, curve: Curves.linear)));

    porcentajeInverso = Tween(begin: 0.0, end: widget.progresoInverso).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.linear)));

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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: 300.0,
          width: 300.0,
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return CustomPaint(
                  painter: CustomProgresIndicator(
                      porcentaje:
                          porcentajeCargar.value - porcentajeInverso.value,
                      puntoInicio: porcentajeInverso.value,
                      colorLineaSegundaria: widget.colorLineaFondo,
                      colorLineaPrimaria: widget.colorLineaPrincipal));
            },
          ),
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

class CustomProgresIndicator extends CustomPainter {
  final double porcentaje;
  final double puntoInicio;
  final Color colorLineaSegundaria;
  final double grosorLineaSegundaria;
  final Color colorLineaPrimaria;
  final double grosorLineaPrimaria;
  CustomProgresIndicator(
      {this.porcentaje = 0,
      this.puntoInicio = 0,
      this.colorLineaSegundaria = Colors.black45,
      this.grosorLineaSegundaria = 5,
      this.colorLineaPrimaria = Colors.redAccent,
      this.grosorLineaPrimaria = 10});

  @override
  void paint(Canvas canvas, Size size) {
    /*----------------- Circulo-----------------------{{}} */
    final paint = new Paint()
      ..color = colorLineaSegundaria
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = grosorLineaSegundaria;

    final Offset c = Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(c, radio, paint);

    /*----------------- Arco-----------------------{{}} */

    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0,0.0), radius: 360);
    final Gradient gradiente = new LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color(0xfff20032),
          Color(0xfff30026),
          Color(0xfff4001a),
          Color(0xfff30909),
          Color(0xfff13800),
          Color(0xffef4f00),
          Color(0xffea6200),
          Color(0xffe57100),
          Color(0xffdf7e00),
          Color(0xffb66bff),
          Color(0xffa200ed),
          Color(0xff7400f1),
          Color(0xff7400f1),
          Color(0xff0e08f3),
          Color(0xff001af5),
          Color(0xff0025f7),
        ],
        stops: [
          0.05,
          0.10,
          0.15,
          0.15,
          0.20,
          0.25,
          0.30,
          0.35,
          0.40,
          0.45,
          0.50,
          0.60,
          0.70,
          0.80,
          0.90,
          1.00,
        ]);
    final paintArc = new Paint()
      //..color = colorLineaPrimaria
      ..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = grosorLineaPrimaria;

    final double arcAngle = 2 * pi * (porcentaje / 100);
    final double arcAngle1 = 2 * pi * ((puntoInicio - 25) / 100);
    canvas.drawArc(Rect.fromCircle(center: c, radius: radio), arcAngle1,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
