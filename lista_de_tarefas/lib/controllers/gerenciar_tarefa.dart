import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/tarefa.dart';

class TelaController {
  TextEditingController caixaNome = TextEditingController();
  TextEditingController caixaStatus = TextEditingController();

  List<Tarefa> _tarefas = [
    Tarefa(nome: 'Respirar', status: 'Completa'),
    Tarefa(nome: 'Piscar os olhos', status: 'Pendente')
  ]; 

  List<Tarefa> get tarefas => _tarefas;

  void adicionarTarefa(){
    Tarefa tarefa = Tarefa();
    tarefa.nome = caixaNome.text;
    tarefa.status = caixaStatus.text;
    _tarefas.add(tarefa);
    caixaNome.clear();
    caixaStatus.clear();
  }

  void removeTarefa(int posicao){
    _tarefas.removeAt(posicao);
  }
}