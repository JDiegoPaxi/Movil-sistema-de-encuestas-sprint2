import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputText extends StatefulWidget {
  final int indexpreg;
  InputText({Key? key, required this.indexpreg}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    final encprov = Provider.of<SingleEncuestaProvider>(context, listen: false);
    return TextField(
      autocorrect: false,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          hintText: 'Escriba su respuesta aqui',
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          )),
      onChanged: (texto) {
        encprov.updaterespuesta(widget.indexpreg, -1, texto);
      },
    );
  }
}
