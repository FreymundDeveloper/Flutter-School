import 'package:flutter/material.dart';
import 'package:flutter_exerc_list4/telas/tela_inicial_ok.dart';
import 'package:flutter_exerc_list4/telas/tela_login.dart';
import 'package:flutter_exerc_list4/telas_exemplo/tela_inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}

