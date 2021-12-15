import 'package:encuestas_flutter/servicios/encuestaservice.dart';
import 'package:flutter/cupertino.dart';

class EncuestaProvider with ChangeNotifier {
  List<dynamic> allencuestas = [];
  EncuestaService eserv = EncuestaService();

  var e;

  EncuestaProvider() {
    getAllEncuestas();
  }

  void getAllEncuestas() async {
    allencuestas = await eserv.getAllEncuestas();
    notifyListeners();
  }

  void getEncuesta(idEcuesta) {
    notifyListeners();
  }
}
