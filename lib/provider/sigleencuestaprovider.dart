//import 'package:encuestas_flutter/components/preguntacard.dart';
import 'package:encuestas_flutter/servicios/encuestaservice.dart';
import 'package:flutter/cupertino.dart';

class SingleEncuestaProvider with ChangeNotifier {
  String ide = '';
  Color? color;
  Map encuesta = {};
  List<dynamic> secciones = [];
  List<dynamic> preguntas = [];
  int indexseccion = -1;
  List<dynamic> respuestas = [];

  void cargarCardPreguntas() async {
    EncuestaService encserv = EncuestaService();

    encuesta = await encserv.getOneEncuesta(ide);
    secciones = encuesta['secciones'];
    indexseccion = 0;
    preguntas = secciones[indexseccion]['preguntas'];
    notifyListeners();
  }

  void setterIDColor(String id, Color c) {
    ide = id;
    color = c;
    print(ide);
  }

  void sigindexSeccion() {
    indexseccion++;
    preguntas = secciones[indexseccion]['preguntas'];
    notifyListeners();
  }

  void antindexSeccion() {
    indexseccion--;
    notifyListeners();
  }

  bool existesig() => indexseccion != secciones.length - 1;
}
