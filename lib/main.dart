import 'package:encuestas_flutter/pages/encuestapage.dart';
import 'package:encuestas_flutter/pages/encuestaspage.dart';
import 'package:encuestas_flutter/provider/encuestaprovider.dart';
import 'package:encuestas_flutter/provider/sigleencuestaprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => EncuestaProvider()),
      ChangeNotifierProvider<SingleEncuestaProvider>(
          create: (_) => SingleEncuestaProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('myapp');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'encuestas',
      routes: {
        'encuestas': (_) => EncuestasPage(),
        'encuesta': (_) => EncuestaPage()
      },
    );
  }
}
