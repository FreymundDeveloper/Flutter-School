import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/controllers/gerenciar_tarefa.dart';
import 'package:lista_de_tarefas/model/tarefa.dart';

class TelaIncial extends StatefulWidget {

  @override
  _TelaIncialState createState() => _TelaIncialState();
}

class _TelaIncialState extends State<TelaIncial> {
  TelaController telaController = TelaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Digite o Nome da tarefa: '),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: telaController.caixaNome,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Digite o Status da tarefa(Completa/Pendente): ')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: telaController.caixaStatus,
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    telaController.adicionarTarefa();
                  });
                },
                child: Text('Salvar'),
              )
            ],
          ),
          Divider(
            thickness: 6,
            color: Colors.grey,
          ),
          Flexible(child: _lista_tarefas2()),
        ],
      ),
    );
  }

  _lista_tarefas(){
    return ListView.builder(
      itemBuilder: (c, i){
        Tarefa tarefa = telaController.tarefas[i];
        String avaliaStatus = tarefa.status;
        return ListTile(
          title: Text(tarefa.nome),
          subtitle: Text(tarefa.status),
          trailing: Icon(_avalia(avaliaStatus)),
          leading: IconButton(
            onPressed: (){
              setState(() {
                telaController.removeTarefa(i);
              });
            },
            icon: Icon(Icons.clear),
          ),
        );
      },
      itemCount: telaController.tarefas.length,
    );
  }

  _lista_tarefas2(){
    return ListView.builder(
      itemBuilder: (c, i){
        Tarefa tarefa = telaController.tarefas[i];
        String avaliaStatus = tarefa.status;
        return InkWell(
          child: ListTile(
            title: Text(tarefa.nome),
            subtitle: Text(tarefa.status),
            trailing: Icon(_avalia(avaliaStatus)),
            leading: IconButton(
              onPressed: (){
                setState(() {
                  telaController.removeTarefa(i);
                });
              },
              icon: Icon(Icons.clear),
            ),
            onTap: (){
              setState(() {
                return _alteraStatus(avaliaStatus, tarefa);
              });
            },
          ),
        );
      },
      itemCount: telaController.tarefas.length,
    );
  }

  _alteraStatus(String avaliaStatus, Tarefa tarefa) {
    switch (avaliaStatus) {
      case 'Completa':
        return tarefa.status = 'Pendente';
      
      case 'Pendente':
        return tarefa.status = 'Completa';
    
      default:
        return tarefa.status = 'ERRO';
    }
  }

  _avalia(avaliaStatus){
    switch (avaliaStatus) {
      case 'Completa':
        return Icons.verified;

      case 'Pendente':
        return Icons.dangerous_rounded;

      default:
        return Icons.device_unknown;
    }
  }
}