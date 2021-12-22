import 'package:encuestas_flutter/components/actionbutton.dart';
import 'package:encuestas_flutter/provider/encuestaprovider.dart';
import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class EncuestasPage extends StatefulWidget {
  EncuestasPage({Key? key}) : super(key: key);

  @override
  _EncuestasPageState createState() => _EncuestasPageState();
}

class _EncuestasPageState extends State<EncuestasPage> {
  @override
  void initState() {
    super.initState();
    print('Comenzar new ');
  }

  List<Color> color = [Color(0xff804000), Color(0xffb86320), Color(0xffbd8a3e)];
  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height * 0.2;
    final seren = Provider.of<EncuestaProvider>(context, listen: true);
    print('crear lista de encuesta');
    return Scaffold(
        backgroundColor: Color(0xfffccca8),
        appBar: AppBar(
          backgroundColor: Color(0xFF804000),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.0,
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: seren.allencuestas.length,
                itemBuilder: (BuildContext context, int index) {
                  print('pintar');
                  return EncuestaCard(
                    ide: seren.allencuestas[index]['_id'],
                    nombre: seren.allencuestas[index]['title'],
                    alto: alto,
                    c: color[index % 3],
                  );
                })));
  }
}

class EncuestaCard extends StatelessWidget {
  final String ide;
  final String nombre;
  final double alto;
  final Color c;

  const EncuestaCard(
      {required this.ide,
      required this.nombre,
      required this.alto,
      required this.c});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              this.nombre,
              style: GoogleFonts.rubik(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ActionButton(
                  icono: Icons.assignment,
                  iconsize: 25,
                  color: Colors.white,
                  onTap: () {
                    print('encuesta realizadas');
                  }),
              SizedBox(
                width: 10,
              ),
              ActionButton(
                  icono: Icons.arrow_forward,
                  iconsize: 25,
                  color: Colors.white,
                  onTap: () {
                    final oneenc = Provider.of<SingleEncuestaProvider>(context,
                        listen: false);
                    oneenc.setterIDColor(ide, c);
                    print(oneenc.encuesta);
                    Navigator.pushNamed(context, 'encuesta');
                  })
            ],
          )
        ],
      ),
      //height: alto,
      width: double.infinity,
      decoration: BoxDecoration(
          color: c, //Color(0xffb86320),
          borderRadius: BorderRadius.circular(25),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ]),
    );
  }
}
