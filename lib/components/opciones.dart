import 'package:encuestas_flutter/components/itemopcion.dart';
import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Opciones extends StatefulWidget {
  final int indexpreg;

  Opciones({Key? key, required this.indexpreg}) : super(key: key);

  @override
  _OpcionesState createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  List<Map> opciones = [];
  List<Widget> options = [];
  @override
  void initState() {
    //options = _builderOpcion();
    print('init state');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _builderOpcion(),
    );
  }

  List<Widget> _builderOpcion() {
    final encprov = Provider.of<SingleEncuestaProvider>(context);
    print('crear');
    List<Widget> opcion = [];
    List<dynamic> opciones = encprov.preguntas[widget.indexpreg]['opciones'];
    bool smult = encprov.preguntas[widget.indexpreg]['selectmultiple'];
    print('----------------------------');
    print(smult);
    for (var i = 0; i < opciones.length; i++) {
      opcion.add(ItemOpcion(
        opcion: opciones[i]['opcion'],
        seleccionMult: smult,
      ));
    }
    return opcion;
  }
}
