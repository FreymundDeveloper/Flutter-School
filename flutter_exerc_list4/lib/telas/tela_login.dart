import 'package:flutter/material.dart';
import 'package:flutter_exerc_list4/telas/tela_inicial_ok.dart';


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();
  TelaInicialOk login = TelaInicialOk();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Login'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Text('Inserir Nome: ')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: nome,
              )
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Text('Inserir Senha: ')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: senha,
              )
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: (){
                _verific(context, nome.text, senha.text);
              }
            ),
          ],
        ),
      ),
      
    );
  }

  _verific(BuildContext context, nome, senha) {
    
    if (nome == 'A' && senha == 'S1') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c){
      return login;
    }));
      
    }
  }
}

