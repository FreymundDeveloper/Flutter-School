import 'dart:math';

Future<List<int>> retornaNPares(int n) async{
  await Future.delayed(Duration(seconds: 2));
  int cont = 1;
  List<int> pares = [];
  while (pares.length != n) {
    if (cont.isEven) pares.add(cont);
    cont++;
  }
  return pares;
}

void subtrai(int n, int m) async {
  retornaNPares(n).then((List<int> value) {
    for (var i = 0; i < value.length; i++) {
      print(value[i] - m);
    }
  });
  List<int> resultado = await retornaNPares(n);
  for (var i = 0; i <  resultado.length; i++) {
    print(resultado[i] - m);
  }
}

Future<int> retornaAleatorio() async{
  await Future.delayed(Duration(seconds: 3));
    Random random = Random();
  return random.nextInt(100);
}

void soma() {
  retornaAleatorio().then((int value){
    Random random = Random();
    print(value + random.nextInt(100));
  });
}

main(List<String> args) {
  soma();
}