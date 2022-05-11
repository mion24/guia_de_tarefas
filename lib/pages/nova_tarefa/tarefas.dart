import 'package:intl/intl.dart';

import 'modelos/tarefa.dart';

class Tarefas {
  final formatadorDeData = DateFormat('dd/MM/yyyy');

  List<Tarefa> listaDeTarefas = []; //lista vazia []

  void adicionarTarefa(Tarefa tarefa) {
    listaDeTarefas.add(tarefa);
  }

  void removerTarefa(Tarefa tarefa) {
    listaDeTarefas.remove(tarefa);
  }
}
