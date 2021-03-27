import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SliderShowCustom extends StatelessWidget {
  final List<Widget> slides;
  final Color colorDotSeleccion;
  final Color colorDotFondo;
  final bool dotArriba;
  final DotTipo tipoDot;

  const SliderShowCustom(
      {@required this.slides,
      this.colorDotSeleccion = Colors.pink,
      this.colorDotFondo = Colors.grey,
      this.dotArriba = false,
      this.tipoDot = DotTipo.Circulo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliverShowProvider(),
      child: Center(
        child: Builder(
          builder: (BuildContext context) {
            
            return Column(
              children: [
                if (this.dotArriba)
                  _Dots(
                    cant: slides.length,
                    colorDotFondo: colorDotFondo,
                    colorDotSeleccion: colorDotSeleccion,
                  ),
                Expanded(child: _Slides(slides: this.slides)),
                if (!this.dotArriba)
                  _Dots(
                    cant: slides.length,
                    colorDotFondo: colorDotFondo,
                    colorDotSeleccion: colorDotSeleccion,
                    tipoDot: tipoDot,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int cant;
  final Color colorDotSeleccion;
  final Color colorDotFondo;
  final DotTipo tipoDot;
  const _Dots(
      {this.cant, this.colorDotSeleccion, this.colorDotFondo, this.tipoDot});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              cant,
              (index) => _Dot(
                index: index,
                colorDotFondo: colorDotFondo,
                colorDotSeleccion: colorDotSeleccion,
                tipoDot: tipoDot,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum DotTipo {
  Circulo,
  Numero,
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorDotSeleccion;
  final Color colorDotFondo;
  final DotTipo tipoDot;
  const _Dot(
      {this.index, this.colorDotSeleccion, this.colorDotFondo, this.tipoDot});

  @override
  Widget build(BuildContext context) {
    final pagina = Provider.of<_SliverShowProvider>(context).pagina;
    final bool seleccion = (pagina >= index - 0.5 && pagina < index + 0.5);
    return tipoDot == DotTipo.Circulo
        ? _dotCirculo(seleccion)
        : _dotNumero(seleccion, index);
  }

  AnimatedContainer _dotCirculo(bool seleccion) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      curve: Curves.decelerate,
      width: seleccion ? 14 : 12,
      height: seleccion ? 14 : 12,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: seleccion ? colorDotSeleccion : colorDotFondo,
          shape: BoxShape.circle),
    );
  }

  AnimatedContainer _dotNumero(bool seleccion, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.decelerate,
      width: seleccion ? 19 : 16,
      height: seleccion ? 19 : 16,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: seleccion ? colorDotSeleccion : colorDotFondo,
              width: seleccion ? 2.0 : 1.0)),
      child: Center(
          child: Text(
        index.toString(),
        style: TextStyle(
            color: seleccion ? colorDotSeleccion : colorDotFondo,
            fontWeight: seleccion ? FontWeight.bold : FontWeight.normal),
      )),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({Key key, this.slides}) : super(key: key);

  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SliverShowProvider>(context, listen: false).pagina =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: pageViewController,
          children: widget.slides
              .map((slide) => _Slide(
                    slide: slide,
                  ))
              .toList(),
        ));
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      height: double.infinity,
      width: double.infinity,
      child: slide,
    );
  }
}

class _SliverShowProvider with ChangeNotifier {
  double _pagina = 0;

  double get pagina => this._pagina;

  set pagina(double pagina) {
    this._pagina = pagina;
    notifyListeners();
  }
}
