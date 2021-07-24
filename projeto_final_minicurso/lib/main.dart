import 'package:flutter/material.dart';
import 'package:projeto_final_minicurso/view/tela_inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Final',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}