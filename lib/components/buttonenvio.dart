import 'package:flutter/material.dart';

class ButtonEnvio extends StatefulWidget {
  final VoidCallback onTap;
  ButtonEnvio({Key? key, required this.onTap}) : super(key: key);

  @override
  _ButtonEnvioState createState() => _ButtonEnvioState();
}

class _ButtonEnvioState extends State<ButtonEnvio> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.white,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Text(
            'Enviar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10)),
        ),
        onTap: widget.onTap);
  }
}
