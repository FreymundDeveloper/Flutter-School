int calcular({required  op, a= 1, b= 1}){
  int resultado = 1;

  switch(op){
    case 1:
       resultado = a + b;
      break;
    case 2:
       resultado = a - b;
      break;
    case 3:
       resultado = a * b;
      break;
    case 4:
       resultado = a % b;
      break;
    default:
       print('invalido.');
      break;
  }
  return resultado;
}

main(List<String> args) {
  print(calcular(op: 4, a: 2, b: 2));
}