//import 'package:encuestas_flutter/components/preguntacard.dart';
import 'package:encuestas_flutter/servicios/encuestaservice.dart';
import 'package:flutter/cupertino.dart';

class SingleEncuestaProvider with ChangeNotifier {
  String ide = '';
  bool enviando = false;
  Color? color;
  Map encuesta = {};
  List<dynamic> secciones = [];
  List<dynamic> preguntas = [];
  int indexseccion = -1;
  List<dynamic> respuestas = [];

  ScrollController sclist = new ScrollController(initialScrollOffset: 0.0);

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
    encuesta = {};
    enviando = false;
    print(ide);
  }

  void sigindexSeccion() {
    indexseccion++;
    preguntas = secciones[indexseccion]['preguntas'];
    sclist.animateTo(0.0,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    notifyListeners();
  }

  void antindexSeccion() {
    indexseccion--;
    preguntas = secciones[indexseccion]['preguntas'];
    sclist.animateTo(0.0,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    notifyListeners();
  }

  bool existesig() => indexseccion != secciones.length - 1;

  

  void guardarRespuesta(int indexpreg, int indexop, String data) {
    if (preguntas[indexpreg]['respuestas'] == null)
      preguntas[indexpreg]['respuestas'] = [];
    respuestas = preguntas[indexpreg]['respuestas'];
    respuestas.add({'index': indexop, 'respuesta': data});
    print(preguntas);
  }

  void retirarRespuesta(int indexpreg, int indexop) {
    respuestas = preguntas[indexpreg]['respuestas'];
    if (preguntas[indexpreg]['respuestas'] != null) {
      respuestas.removeWhere((e) => (e['index'] == indexop));
    }
  }

  void updaterespuesta(int indexpreg, int indexop, String data) {
    if (preguntas[indexpreg]['respuestas'] == null)
      preguntas[indexpreg]['respuestas'] = [];

    respuestas = preguntas[indexpreg]['respuestas'];
    if (respuestas.isNotEmpty) respuestas.removeLast();
    respuestas.add({"index": indexop, "respuesta": data});
    print(preguntas);
  }

  Future<void> enviar() async {
    EncuestaService encserv = EncuestaService();
    enviando = true;
    notifyListeners();
    await encserv.enviarEncuesta(encuesta);
  }
}
