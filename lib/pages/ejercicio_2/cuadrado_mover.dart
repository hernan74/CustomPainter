import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CuadradoAnimado();
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  bool parar = true;
  AnimationController controller;

  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.easeOutBack)));
    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.50, curve: Curves.easeOutBack)));

    moverIzquierda = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.50, 0.75, curve: Curves.easeOutBack)));
    moverAbajo = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeOutBack)));

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
        title: Text('Ejemplo 2'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          child: _Rectangulo(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
                offset: Offset(moverDerecha.value - moverIzquierda.value,
                    moverArriba.value - moverAbajo.value),
                child: child);
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
