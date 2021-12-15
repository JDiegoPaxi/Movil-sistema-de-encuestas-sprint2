import 'package:flutter/cupertino.dart';

class OpcionProvider with ChangeNotifier {
  bool seleccionado = true;

  void changeSelect() {
    seleccionado = !seleccionado;
    notifyListeners();
  }
}
