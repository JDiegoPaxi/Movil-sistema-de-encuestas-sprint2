import 'package:flutter/material.dart';

class LabelSeccion extends StatelessWidget {
  final int nroseccion;
  final String? titulo;
  final Color color;
  const LabelSeccion(
      {Key? key,
      required this.nroseccion,
      required this.titulo,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return titulo == null
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            padding: EdgeInsets.all(10),
            color: color,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sección: ${nroseccion + 1}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  width: 10,
                  height: 20,
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Text(titulo!)
              ],
            ),
          );
  }
}
