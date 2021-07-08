class ValorInvalido implements
  Exception{
    @override
    String toString(){
      return 'Valor Invalido';
    }
  }

int retornaMaior(int a, int b){
  int maior = 0;
  if(a == b){
    throw Exception('Valores iguais');
  } else if (a>b) {
    maior = a;
  }else{
    maior = b;
  }
  return maior;
}

int retornaValor_valido(int a) {
  if (a < 0 || a > 20) {
    throw ValorInvalido();
  }else{
    return a;
  }
}

main(List<String> args) {
  try{
    print(retornaValor_valido(21));
  }
  on Exception catch (e) {
    print(e);
  }
}