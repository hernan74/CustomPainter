import 'package:flutter/material.dart';

class TextAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 3'),
      ),
      body: Center(
          child: _Rectangulo(
        posicionDYLetra: 0.00, //0.0
        posicionDXLetra: 0.15,
        //0.15
        sizeLetra: 200,
      )),
    );
  }
}

class _Rectangulo extends StatefulWidget {
  final double posicionDYLetra;
  final double posicionDXLetra;
  final double posicionDYUbi;
  final double posicionDXUbi;
  final double sizeLetra;

  const _Rectangulo(
      {this.posicionDYLetra = 0.5,
      this.sizeLetra = 100,
      this.posicionDXLetra = 0.5,
      this.posicionDYUbi = 0.24,
      this.posicionDXUbi = 0.07});

  @override
  __RectanguloState createState() => __RectanguloState();
}

class __RectanguloState extends State<_Rectangulo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> posicionDYLetra;
  Animation<double> posicionDXLetra;
  Animation<double> posicionDXUbi;
  Animation<double> posicionDYUbi;
  Animation<double> sizeLetra;

  Animation<double> moverArriba;

  bool parar = true;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    //Letras
    posicionDYLetra = Tween(begin: 0.94, end: widget.posicionDYLetra).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    posicionDXLetra = Tween(begin: 0.0, end: widget.posicionDXLetra).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));
    //Ubicacion
    posicionDYUbi = Tween(begin: 0.10, end: widget.posicionDYLetra).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    posicionDXUbi = Tween(begin: 0.07, end: widget.posicionDXLetra).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    //Tamaño Letra
    sizeLetra = Tween(begin: 0.0, end: widget.sizeLetra).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.50, curve: Curves.easeOutBack)));

    controller.forward();
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
    Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(size.width * posicionDXUbi.value,
                    size.height * -posicionDYUbi.value),
                child: CustomPaint(
                  painter: _CrearPalabra(
                      // sizeLetra: 200, posicionDX: 0.0, posicionDY: 0.94
                      sizeLetra: sizeLetra.value,
                      posicionDY: posicionDYLetra.value,
                      posicionDX: posicionDXLetra.value),
                ),
              );
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

class _CrearPalabra extends CustomPainter {
  final double posicionDY;
  final double posicionDX;
  final double sizeLetra;

  _CrearPalabra({this.posicionDX, this.posicionDY, this.sizeLetra});

  @override
  void paint(Canvas canvas, Size size) {
    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.blue[800], fontSize: sizeLetra),
        text: 'H');
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(
        canvas, new Offset(size.width * posicionDX, size.height * posicionDY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
