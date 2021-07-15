import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

//AVISO.. O PROGRAMA NÃO FUNCIONA TOATALMENTE... O DELAEY NÃO É PRECISO EM 1 MINUTO, POIS A FUNÇÃO "_CALCULAR" TEM ...
//UM TEMPO DE PROCESSAMENTO MUITO EXETENSO;
//PS:NO MOMENTO EM QUE ESTOU A FAZER ESTE PROGRAMA, SOU APENAS UM MERO INICAINTE EM PROGRAMAÇÃO DART/FLUTTER.

class TelaLocalizacao extends StatefulWidget {
  const TelaLocalizacao({Key? key}) : super(key: key);

  @override
  _TelaLocalizacaoState createState() => _TelaLocalizacaoState();
}

class _TelaLocalizacaoState extends State<TelaLocalizacao> {
  LocationData? local;
  StreamSubscription? inscricao;
  bool first = true;
  double cconv = 0.0;
  double cconv2 = 0.0;
  double conv = 0.0;
  double conv2 = 0.0;
  double resultado = 0.0;
  bool chave = true;
  double valor1 = 0.0;
  double valor2 = 0.0;
  double verif = 0.0;
  double retorna = 0.0;

  @override
  void initState() {
    super.initState();
    Location.instance.changeSettings(interval: 60000, accuracy: LocationAccuracy.high);
    inscricao = Location.instance.onLocationChanged.listen((event) {
      //Future.delayed(const Duration(milliseconds: 60000), () {});
      setState(() {
        local = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: local != null ? Text(''' 
        lat = ${local!.latitude}
        long = ${local!.longitude}
        alt = ${local!.altitude}
        m = ${_calcula(local!.latitude!.toStringAsFixed(20), local!.longitude!.toStringAsFixed(20))}
        ''') : Text(''' 
        lat = ${0.0}
        long = ${0.0}
        alt = ${0.0}
        m = ${0.0}
        CARREGANDO...
        '''),
      ),
    );
  }

  @override
  void dispose() {
    inscricao!.cancel();
    super.dispose();
  }

  _calcula(a, b){//não funciona
    if (chave == true) {
      conv = double.parse(a);//-2 //-2.1
      conv2 = double.parse(b);//-3  //-3.1
      if (verif != (conv + conv2)) {
        verif = conv + conv2;
        conv = conv - cconv;//-2-0  //-2.1-(-1)=-1.1
        conv2 = conv2 - cconv2;//-3-0 //-3.1-(-1)=-2.1

        valor1 = (conv*1852) + (conv2*1852);//-2*2+(-3*2)=-12// -1.1*2+ -2.1*2=-6.4

        chave = false;


        if(resultado != 0){//resultado =0 // resultado = 2 
       
          resultado = (valor1 - valor2)-resultado;
          
          return retorna.toString();//5.2
        
        }else{
          resultado = (valor1 - valor2)-resultado;
          return 0.0.toString();//retorna 0
        }
        
      }else{return 0.0.toString();}

    } else {
      cconv = double.parse(a);//-1// -3 
      cconv2 = double.parse(b);//-1// -4
      if (verif != (cconv+cconv2)) {
        verif = cconv+cconv2;
        cconv = cconv - conv;//-1-2=-3// -3-(-1.1) = -1.9
        cconv2 = cconv2 - conv2;//-1-3=-4// -4-(-2.1) = -1.9

        valor2 = (cconv*1852) + (cconv2*1852);//-3*2+(-4*2)=-14// -7,6

        chave = true;

        resultado = (valor1 - valor2)-resultado;//-12-(-14)-0=2// -6.4-(-7.6)
        if (resultado<0) {
          retorna =resultado*-1;
        }else{retorna = resultado;}
        return retorna.toString();// retorna 2 // 4
        
      }else{return 0.0.toString();}
    }
  }
}