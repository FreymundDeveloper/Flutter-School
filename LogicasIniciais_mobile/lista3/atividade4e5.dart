abstract class Animal {
  String nome = '';
  String cor = '';

  String emitirSom();
}

class Macaco extends Animal{
  String nome = '';
  String cor = '';
  String medida = '';

  Macaco(this.nome, this.cor, this.medida);

  @override
  String emitirSom() => 'uu';

  String toString(){
    return 'O $nome e $cor e tambem $medida, seu som e "${emitirSom()}"';
  }
}

class Pinto extends Animal{
  String nome = '';
  String cor = '';
  String medida = '';

  Pinto(this.nome, this.cor, this.medida);

  @override
  String emitirSom() => 'bau';

  String toString(){
    return 'O $nome e $cor e tambem $medida, seu som e "${emitirSom()}"';
  }
}

main(List<String> args) {
  List<void> lista = [];
  Pinto a = Pinto('Pinto', 'Amarelo', 'Grosso');
  Macaco b = Macaco('Macao', 'Marrom', 'Fino');
  lista.add(a); 
  lista.add(b);
  print('${a}\n${b}');
  print(lista);
}