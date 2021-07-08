mixin Aceleracao{
  double acelerar();
}

class Carro with Aceleracao{
  double distancia = 0.0;

  Carro(this.distancia);

  double acelerar() => distancia + 100;

  @override
  String toString(){
    return acelerar().toString();
  }
}

class Foguete with Aceleracao{
  double distancia = 0.0;

  Foguete(this.distancia);

  double acelerar() => distancia + 1000;

  @override
  String toString(){
    return acelerar().toString();
  }
}

main(List<String> args) {
  Carro a = Carro(20);
  Foguete b = Foguete(200);
  print('Vel.Carro: ${a}m/s\nVel.Foguete: ${b}m/s');
}