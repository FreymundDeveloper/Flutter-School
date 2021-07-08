class Animal {
  bool _aquatico = false;
  String especie = '';
  double peso = 0.0;

  Animal({required this.especie, required this.peso});

  void set isAquatico(bool aquatico) {
    _aquatico = aquatico;
    peso -= 5;
  }

  bool get isAquatico {
    return _aquatico;
  }

  String _agua(){
    if (_aquatico) {
      return 'aquatico';
    }else{
      return 'outro';
    }
  }

  @override
  String toString(){
    return '''
    Especie: $especie
    Peso: $peso kg
    ${_agua()}
    ''';
  }
}

main(List<String> args) {
  Animal a = Animal(especie: 'Mamifero', peso: 1000);
  a.isAquatico = true;
  print(a);
}