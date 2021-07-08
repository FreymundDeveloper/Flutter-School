import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_exerc_list4/telas/tela_login.dart';

class TelaInicialOk extends StatefulWidget {
  @override
  _TelaInicialOkState createState() => _TelaInicialOkState();
}

class _TelaInicialOkState extends State<TelaInicialOk> {
    TelaLogin retornar = TelaLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(margin: EdgeInsets.all(5),child: Text('Parabens, adeus'),)
            ),
            Center(
              child: Container(
                child: ElevatedButton(
                  child: Text('Logout'),onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c){
                      return retornar;
                    }));
                  }
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}