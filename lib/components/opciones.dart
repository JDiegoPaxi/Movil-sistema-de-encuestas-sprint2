import 'package:encuestas_flutter/components/itemcheckopcion.dart';
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
  int select = -1;
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
      if (smult) {
        opcion.add(ItemCheckOpcion(
          indexpreg: widget.indexpreg,
          indexop: i,
          opcion: opciones[i]['opcion'],
        ));
      } else {
        opcion.add(
          Container(
              child: RadioListTile<int>(
                  value: i,
                  activeColor: Colors.white,
                  selected: i == select,
                  title: Text(
                    opciones[i]['opcion'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  groupValue: select,
                  selectedTileColor: Colors.white,
                  onChanged: (valor) {
                    print(valor);
                    setState(() {
                      select = valor!;
                      encprov.updaterespuesta(
                          widget.indexpreg, select, opciones[select]['opcion']);
                    });
                  }),
              decoration: BoxDecoration(
                  color: select == i ? encprov.color : null,
                  border: Border.all(
                    color: select == i ? Colors.white : Colors.white24,
                  ),
                  borderRadius: BorderRadius.circular(15))),
        );
      }
    }
    return opcion;
  }
}
