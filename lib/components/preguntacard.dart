import 'package:encuestas_flutter/components/opciones.dart';
import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreguntaCard extends StatefulWidget {
  final int index;
  PreguntaCard({Key? key, required this.index}) : super(key: key);

  @override
  _PreguntaCardState createState() => _PreguntaCardState();
}

class _PreguntaCardState extends State<PreguntaCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final encprov = Provider.of<SingleEncuestaProvider>(context);
    print('tarjeta');
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Text(
              '${widget.index + 1}' +
                  '. ' +
                  encprov.preguntas[widget.index]['descripcion'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: _getTypeRespuesta(
                encprov.preguntas[widget.index]['istypeabierto']),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                border: Border.all(color: Colors.brown, width: 3)),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: encprov.color,
      ),
    );
  }

  Widget _getTypeRespuesta(bool type) {
    return type
        ? TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
          )
        : Opciones(indexpreg: widget.index);
  }

  @override
  bool get wantKeepAlive => true;
}
