import 'package:encuestas_flutter/components/actionbutton.dart';
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
    return Scaffold(
        backgroundColor: Color(0xfffccca8),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: altura * 0.2,
                color: provenc.color,
                child: SafeArea(
                  child: Container(
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
                height: altura * 0.8,
                child: provenc.encuesta.isNotEmpty
                    ? ListView.builder(
                        addRepaintBoundaries: false,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        itemCount: provenc.preguntas.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index < provenc.preguntas.length
                              ? PreguntaCard(
                                  index: index,
                                )
                              : Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      ActionButton(
                                          icono: Icons.arrow_back,
                                          onTap: () {}),
                                      ActionButton(
                                          icono:
                                              Icons.arrow_forward_ios_rounded,
                                          onTap: () {})
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
        ));
  }
}
