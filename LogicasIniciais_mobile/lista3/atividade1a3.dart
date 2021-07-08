class Quadrado {
  double lado = 0.0;

  double calcularArea(){
    return lado;
  }

  double calcularPerimetro(){
    return lado * 4;
  }
}

class Retangulo extends Quadrado {
  double lado = 0.0;
  double lado2 = 0.0;

  Retangulo ({required this.lado, required this.lado2});

  double calcularArea() {
    return lado * lado2;
  }

  @override
  String toString(){
    return 'Area:${calcularArea()}\nPerimetro:${calcularPerimetro()}';
  }
  
}

main(List<String> args) {
  Retangulo a = Retangulo(lado: 5, lado2: 10);
  print(a);
}