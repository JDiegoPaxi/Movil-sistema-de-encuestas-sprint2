import 'package:encuestas_flutter/components/actionbutton.dart';
import 'package:encuestas_flutter/components/buttonenvio.dart';
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
    return WillPopScope(
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
          ),
          backgroundColor: Color(0xfffccca8),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: altura * 0.15,
                  color: provenc.color,
                  child: SafeArea(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        provenc.encuesta.isNotEmpty
                            ? provenc.encuesta['title']
                            : 'Vacio',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: altura * 0.75,
                  child: provenc.encuesta.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          itemCount: provenc.preguntas.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            return index < provenc.preguntas.length
                                ? PreguntaCard(
                                    index: index,
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
                                                  print('+++');

                                                  setState(() {});
                                                })
                                            : Container(),
                                        provenc.existesig()
                                            ? ActionButton(
                                                icono: Icons.arrow_forward_ios,
                                                iconsize: 35,
                                                color: provenc.color!,
                                                onTap: () {
                                                  provenc.sigindexSeccion();
                                                })
                                            : ButtonEnvio(onTap: () {})
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
    );
  }
}
