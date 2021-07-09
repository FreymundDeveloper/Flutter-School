import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/view/tela_incial_app.dart';

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      home: TelaIncial(),
      debugShowCheckedModeBanner: false,
    );
  }
}