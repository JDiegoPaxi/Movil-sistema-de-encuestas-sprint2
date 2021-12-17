//import 'package:encuestas_flutter/provider/opcionprovider.dart';
import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class ItemCheckOpcion extends StatefulWidget {
  final String opcion;

  final int indexpreg;
  final int indexop;

  ItemCheckOpcion(
      {required this.indexpreg, required this.indexop, required this.opcion});

  @override
  _ItemCheckOpcionState createState() => _ItemCheckOpcionState();
}

class _ItemCheckOpcionState extends State<ItemCheckOpcion> {
  bool b = false;
  @override
  Widget build(BuildContext context) {
    print('check');
    final op = Provider.of<SingleEncuestaProvider>(context);
    return Container(
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
      decoration: BoxDecoration(
          color: b ? op.color : null,
          border: Border.all(
            color: b ? Colors.white : Colors.white24,
          ),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
