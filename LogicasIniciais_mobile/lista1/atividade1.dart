int expo({required int a, int b =2}){
  int retorno = 1;
  for (int i = 0; i < b; i++){
    retorno = retorno * a;
  }
  return retorno;
}

//#####################################

main(List<String> args){
  print(expo(a: 3, b: 3));
}