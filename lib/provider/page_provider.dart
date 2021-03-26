import 'package:flutter/cupertino.dart';

class PageProvider extends ChangeNotifier {
  int _pagina = 0;

  PageController _pageController = new PageController();

  PageController get pageController => _pageController;

  set paginaActual(int pagina) {
    this._pagina = pagina;
    _pageController.animateToPage(_pagina,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  int get pagina => _pagina;

  set pagina(int pagina) {
    _pagina = pagina;
    notifyListeners();
  }
}
