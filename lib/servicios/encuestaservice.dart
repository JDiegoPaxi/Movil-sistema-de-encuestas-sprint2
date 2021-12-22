import 'dart:convert';

import 'package:http/http.dart' as http;

class EncuestaService {
  String url1 = "http://192.168.1.3:3001/";

  Future<List<dynamic>> getAllEncuestas() async {
    String url = '';

    url = url1 + 'sistemaencuestas/';

    Map<String, String> headers = {"Content-type": "application/json"};
    final resp = await http.get(Uri.parse(url), headers: headers);

    final decode = json.decode(resp.body);
    print(decode);

    return decode['encuestas'];
  }

  Future<Map> getOneEncuesta(String ide) async {
    String url = '';

    url = url1 + 'sistemaencuestas/' + ide;

    Map<String, String> headers = {"Content-type": "application/json"};
    final resp = await http.get(Uri.parse(url), headers: headers);

    final decode = json.decode(resp.body);
    print(decode);

    return decode['encuesta']; //decode['encuesta'];
  }

  Future<bool> enviarEncuesta(Map encuesta) async {
    String url = url1 + 'sistemaencuestas/';

    Map<String, String> headers = {"Content-type": "application/json"};
    final body = json.encode(encuesta);
    final resp = await http.post(Uri.parse(url), headers: headers, body: body);

    final decode = json.decode(resp.body);
    print(decode);

    return decode['ok'];
  }
}
