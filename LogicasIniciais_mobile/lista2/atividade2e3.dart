enum Regiao {
  Norte,
  Sul,
  Oeste,
  Leste,
}

class Bairro {
  String nome = '';
  String regiao = '';

  Bairro({required this.nome, required this.regiao});

  @override
  String toString(){
    return '''
    Nome: $nome
    Regiao: $regiao
    ''';
  }
}

class Cidade {
  String nome = '';
  List<String>bairros = ['Norte', 'um bairro1', 'Norte', 'um bairro2', 'Sul', 'um bairro3'];
  List<String>ok = [];
  String vai = '';

  String filtrarBairros(){
    Regiao regiao = Regiao.Norte;
    String local = '';

    switch (regiao) {
      case Regiao.Norte :
         local = 'Norte';
        break;
      case Regiao.Sul :
         local = 'Sul';
        break;
      case Regiao.Oeste:
         local = 'Oeste';
        break;
      case Regiao.Leste :
         local = 'Leste';
        break;
      default:
        print('');
        break;
    }
    int count = 0;
    while (count < bairros.length) {
      if (bairros[count] ==  local) {
        ok.add(bairros[count+1]);
      }
      count += 2;
    }
    for (var i = 0; i < ok.length; i++) {
      vai = vai + '\n' + ok[i];
    }
    return vai;
  }
  @override
  String toString(){
    return filtrarBairros();
  }
}

main(List<String> args) {
  Cidade a = Cidade();
  print(a);
}