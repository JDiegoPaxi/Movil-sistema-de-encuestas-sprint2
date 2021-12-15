import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final IconData icono;
  final VoidCallback onTap;
  ActionButton({Key? key, required this.onTap, required this.icono})
      : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.yellow,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Icon(
            //Icons.assignment,
            widget.icono,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        onTap: widget.onTap);
  }
}
