import 'package:flutter/material.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/modelos/tarefa.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/tarefas.dart';

class CardTarefa extends StatelessWidget {
  final Tarefa tarefa;
  final Tarefas tarefas;
  const CardTarefa({Key? key, required this.tarefa, required this.tarefas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0) //quao redondo e a borda
          ),
      margin: const EdgeInsets.all(8.0),
      elevation: 1.2,
      child: Container(
        width: double.maxFinite, //maior num finito definido como largura
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //alinhar no começo da pagina
          children: [
            Align(
              child: Text(tarefa.titulo ??
                  ''), //alinhando somente o text titulo no meio
              alignment: Alignment.center,
            ),
            Text('Descrição: ${tarefa.descricao} ?? ' ''),
            Text(
                'Data: ${tarefas.formatadorDeData.format(tarefa.data!)}'), //formatar daata
            Text('Hora ${tarefa.hora!.format(context)}'),
          ],
        ),
      ),
    );
  }
}
