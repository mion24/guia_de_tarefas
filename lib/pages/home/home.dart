import 'package:flutter/material.dart';
import 'package:guia_de_tarefas/pages/home/components/card_tarefa.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/nova_tarefa.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/tarefas.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tarefas = Tarefas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Guia de Tarefas'),
          centerTitle: true, //alinha centro
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                  //abrir nova pagina  push significa empilhar a pag
                  MaterialPageRoute(
                      builder: (context) => NovaTarefa(
                            tarefas: tarefas,
                          )),
                )
                .whenComplete(recrregaLista);
          },
          child: Icon(Icons.add, size: 40),
        ),
        body: ListView.builder(
            itemCount: tarefas.listaDeTarefas.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onLongPress: (() {
                  setState(() {
                    tarefas.removerTarefa(
                      tarefas.listaDeTarefas.elementAt(index),
                    );
                  });
                }),
                child: CardTarefa(
                  tarefa: tarefas.listaDeTarefas.elementAt(index),
                  tarefas: tarefas,
                ),
              );
            })));
  }

  recrregaLista() => setState(
        () {},
      );
}
