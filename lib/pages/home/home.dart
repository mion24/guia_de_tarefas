import 'package:flutter/material.dart';
import 'package:guia_de_tarefas/pages/home/components/card_tarefa.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/nova_tarefa.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia de Tarefas'),
        centerTitle: true, //alinha centro
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            //abrir nova pagina  push significa empilhar a pag
            MaterialPageRoute(builder: (context) => NovaTarefa()),
          );
        },
        child: Icon(Icons.add, size: 40),
      ),
      body: Column(
        children: [CardTarefa()],
      ),
    );
  }
}
