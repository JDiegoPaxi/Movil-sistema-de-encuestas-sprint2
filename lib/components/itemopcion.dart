//import 'package:encuestas_flutter/provider/opcionprovider.dart';
import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class ItemOpcion extends StatefulWidget {
  final String opcion;
  final bool seleccionMult;

  ItemOpcion({required this.opcion, required this.seleccionMult});

  @override
  _ItemOpcionState createState() => _ItemOpcionState();
}

class _ItemOpcionState extends State<ItemOpcion> {
  bool b = false;
  @override
  Widget build(BuildContext context) {
    print('check');
    final op = Provider.of<SingleEncuestaProvider>(context);
    return widget.seleccionMult
        ? Container(
            color: b ? op.color : null,
            child: CheckboxListTile(
                value: b,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  widget.opcion,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                selectedTileColor: Colors.black,
                activeColor: Colors.white,
                checkColor: op.color,
                tileColor: Colors.yellow,
                selected: b,
                onChanged: (bool? valor) {
                  setState(() {
                    b = !b;
                    print(valor);
                  });
                }),
          )
        : RadioListTile(
            value: b,
            title: Text(
              widget.opcion,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            groupValue: '',
            onChanged: (valor) {
              print(valor);
              setState(() {
                b = !b;
              });
            });
  }
}
