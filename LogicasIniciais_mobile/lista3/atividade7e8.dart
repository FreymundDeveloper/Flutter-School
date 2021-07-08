import 'dart:math';
class Aluno {
  String nome = "";
  int idade = 0;
  List<double> notas = [];

  Aluno({required this.nome, required this.idade, required this.notas});

  double calcularMedia() {
    double media = 0;
    for (double nota in notas) {
      media += nota;
    }
    return media / notas.length;
  }

  @override
  String toString() {
    return '$nome - $idade anos - MF: ${calcularMedia().toStringAsPrecision(2)}';
  }
}

class Turma {
  List<Aluno> _alunos = [];
  void adicionarAlunos(Aluno aluno) {
    _alunos.add(aluno);
  }

  List<Aluno> filtrarAprovados() {
    List<Aluno> aprovados = [];
    for (Aluno aluno in _alunos) {
      if (aluno.calcularMedia() >= 7) aprovados.add(aluno);
    }
    return aprovados;
  }
}

main(List<String> args) {
  Turma turma = Turma();

  turma.adicionarAlunos(
      Aluno(nome: 'Joao', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Julia', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Leticia', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Maria', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Matheus', idade: 19, notas: gerarNotasAleatorias(5)));
  turma.adicionarAlunos(
      Aluno(nome: 'Marcos', idade: 19, notas: gerarNotasAleatorias(5)));

  List<Aluno> aprovados = turma.filtrarAprovados();
  aprovados.sort((aluno1, aluno2) => aluno1.nome.compareTo(aluno2.nome));

  aprovados.forEach((element) {
    print(element);
  });

  print('---------------------------------------');

  aprovados.sort((aluno1, aluno2) =>
      aluno1.calcularMedia().compareTo(aluno2.calcularMedia()));

  aprovados.forEach((element) {
    print(element);
  });
}

double gerarNotaAleatoria() {
  // Retorna uma nota aleatoria entre 5 e 10.
  Random random = Random();
  return 5 + random.nextDouble() * 5;
}

List<double> gerarNotasAleatorias(int n) {
  List<double> notas = [];
  for (int i = 0; i < n; i++) {
    notas.add(gerarNotaAleatoria());
  }
  return notas;
}