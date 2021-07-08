//ctrl+shift+'

void traduz(Map<String, String> palavras, bool traduzir) {
// Sua implementacao
var lista = palavras.values.toList();
var list = palavras.keys.toList();
  if (traduzir == false) {
    int count = 0;
    while (count < 4) {
      print(lista[count]);
      count += 1;
    }
  }
  else {
     int count = 0;
    while (count < 4) {
      print(list[count]);
      count += 1;
    }
  }
}
main(List<String> args) {
  Map<String, String> frutas = { 
    'Banana': 'Banana',
    'Strawberry': 'Morango', 
    'Orange': 'Laranja', 
    'Watermelon': 'Melancia'
  };

  print('Original:');
  traduz(frutas, false);
  print('\nTraduzido:');
  traduz(frutas, true);
}