import 'dart:async';

import 'package:encuestas_flutter/components/actionbutton.dart';
import 'package:encuestas_flutter/components/buttonenvio.dart';
import 'package:encuestas_flutter/components/enviarview.dart';
import 'package:encuestas_flutter/components/labelseccion.dart';
import 'package:encuestas_flutter/components/preguntacard.dart';
import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EncuestaPage extends StatefulWidget {
  EncuestaPage({Key? key}) : super(key: key);

  @override
  _EncuestaPageState createState() => _EncuestaPageState();
}

class _EncuestaPageState extends State<EncuestaPage> {
  @override
  void initState() {
    final provenc = Provider.of<SingleEncuestaProvider>(context, listen: false);
    provenc.cargarCardPreguntas();
    print('cargar tarjetas');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provenc = Provider.of<SingleEncuestaProvider>(context);
    print('listview');
    double altura = MediaQuery.of(context).size.height;
    return Stack(children: [
      WillPopScope(
        onWillPop: () async => await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('¿Desea salir de la encuesta?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            'encuestas', (route) => false);
                      },
                      child: Text('Si')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('No'))
                ],
              );
            }),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: provenc.color,
              automaticallyImplyLeading: provenc.indexseccion == 0,
              elevation: 0,
            ),
            backgroundColor: Color(0xfffccca8),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Material(
                    elevation: 10,
                    child: Container(
                      width: double.infinity,
                      height: altura * 0.10,
                      color: provenc.color,
                      child: SafeArea(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            provenc.encuesta.isNotEmpty
                                ? provenc.encuesta['title']
                                : '',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: altura * 0.80,
                    child: provenc.encuesta.isNotEmpty
                        ? ListView.builder(
                            controller: provenc.sclist,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            itemCount: provenc.preguntas.length + 2,
                            itemBuilder: (BuildContext context, int index) {
                              return index < provenc.preguntas.length + 1
                                  ? index == 0
                                      ? LabelSeccion(
                                          nroseccion: provenc.indexseccion,
                                          titulo: provenc.secciones[
                                              provenc.indexseccion]['title'],
                                          color: provenc.color!,
                                        )
                                      : PreguntaCard(
                                          index: index - 1,
                                        )
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          provenc.indexseccion != 0
                                              ? ActionButton(
                                                  icono: Icons
                                                      .arrow_back_ios_new_sharp,
                                                  iconsize: 35,
                                                  color: provenc.color!,
                                                  onTap: () {
                                                    provenc.antindexSeccion();
                                                  })
                                              : Container(),
                                          provenc.existesig()
                                              ? ActionButton(
                                                  icono:
                                                      Icons.arrow_forward_ios,
                                                  iconsize: 35,
                                                  color: provenc.color!,
                                                  onTap: () {
                                                    provenc.sigindexSeccion();
                                                  })
                                              : ButtonEnvio(onTap: () async {
                                                  await provenc
                                                      .enviar()
                                                      .then((value) {
                                                    Timer.periodic(
                                                        Duration(seconds: 1),
                                                        (_) => {
                                                              Navigator
                                                                  .pushNamedAndRemoveUntil(
                                                                      context,
                                                                      'encuestas',
                                                                      (route) =>
                                                                          false)
                                                            });
                                                  });
                                                })
                                        ],
                                      ),
                                    );
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ],
              ),
            )),
      ),
      provenc.enviando ? EnviarView() : Container()
    ]);
  }
}
