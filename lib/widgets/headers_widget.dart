import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCuadradoPaiter()),
    );
  }
}

class _HeaderCuadradoPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo
    path.lineTo(0, size.height * 0.25);

    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderConBordeCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderrConBordeCircularPaiter()),
    );
  }
}

class _HeaderrConBordeCircularPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.redAccent;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo

    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(
        0, size.height * 0.30, size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width, size.height * 0.3, size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    //path.lineTo(size.width, 0);

    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPaiter(),
      ),
    );
  }
}

class _HeaderDiagonalPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.greenAccent;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo

    path.moveTo(0, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPaiter(),
      ),
    );
  }
}

class _HeaderTriangularPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangularCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangulaCurvoPaiter(),
      ),
    );
  }
}

class _HeaderTriangulaCurvoPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.deepOrange;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.25,
        size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.60, size.height * 0.75, size.width, size.height);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderConPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderConPicoPaiter(),
      ),
    );
  }
}

class _HeaderConPicoPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.purpleAccent;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.37);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPaiter(),
      ),
    );
  }
}

class _HeaderCurvoPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.yellowAccent;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.45, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePaiter(),
      ),
    );
  }
}

class _HeaderWavePaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.amberAccent;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveInvertido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderInvertidoPaiter(),
      ),
    );
  }
}

class _HeaderInvertidoPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.cyanAccent;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientePaiter(),
      ),
    );
  }
}

class _HeaderWaveGradientePaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 150.0), radius: 180);
    final Gradient gradiente = new LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color(0xffb66bff),
          Color(0xff7c4dff),
          Color(0xff2033e9),
        ],
        stops: [
          0.2,
          0.6,
          1.0
        ]);

    final paint = new Paint()..shader = gradiente.createShader(rect);

    //Propiedades
    paint.color = Colors.deepPurpleAccent;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 15;

    final path = new Path();

    //Dibujo
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
