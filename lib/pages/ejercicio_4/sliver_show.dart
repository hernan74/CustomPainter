import 'package:flutter/material.dart';
import 'package:flutter_disenos/provider/sliver_show.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SliverShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliverShowProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('titulo'),
        ),
        body: Center(
          child: Column(
            children: [Expanded(child: _Slides()), _Dots()],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({this.index});

  @override
  Widget build(BuildContext context) {
    final pagina = Provider.of<SliverShowProvider>(context).pagina;
    final bool seleccion = (pagina >= index - 0.5 && pagina < index + 0.5);
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.decelerate,
      width: seleccion ? 14 : 12,
      height: seleccion ? 14 : 12,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: seleccion ? Colors.pink : Colors.grey, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<SliverShowProvider>(context, listen: false).pagina =
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
      child: PageView(
        controller: pageViewController,
        children: [
          _Slide(svg: 'assets/slide-1.svg'),
          _Slide(svg: 'assets/slide-2.svg'),
          _Slide(svg: 'assets/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30.0),
        height: double.infinity,
        width: double.infinity,
        child: SvgPicture.asset(
          svg,
        ));
  }
}
