import 'package:flutter/cupertino.dart';

class SliverShowProvider with ChangeNotifier {
  double _pagina = 0;

  double get pagina => this._pagina;

  set pagina(double pagina) {
    this._pagina = pagina;
    notifyListeners();
  }
}
