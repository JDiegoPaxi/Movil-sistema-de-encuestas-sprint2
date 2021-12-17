import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final IconData icono;
  final VoidCallback onTap;
  final Color color;
  final double iconsize;
  ActionButton(
      {Key? key,
      required this.icono,
      required this.iconsize,
      required this.onTap,
      required this.color})
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
            color: widget.color,
            size: widget.iconsize,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: widget.color, width: 3),
              borderRadius: BorderRadius.circular(10)),
        ),
        onTap: widget.onTap);
  }
}
