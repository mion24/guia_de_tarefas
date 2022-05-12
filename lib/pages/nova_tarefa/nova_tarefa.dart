import 'package:flutter/material.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/modelos/tarefa.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/tarefas.dart';

class NovaTarefa extends StatefulWidget {
  final Tarefas tarefas;

  const NovaTarefa({Key? key, required this.tarefas}) : super(key: key);

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  @override
  //usar ctrl . pra importar o arquivo extra
  var data = DateTime.now();
  var hora = TimeOfDay.now(); //hora do dia atual

  TextEditingController tituloController = TextEditingController(text: '');
  TextEditingController descricaoController = TextEditingController(text: '');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Tarefa'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: tituloController,
              decoration: InputDecoration(
                label: Text('Titulo'),
                hintText: 'Digite o título',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descricaoController,
              decoration: InputDecoration(
                label: Text('Descrição'),
                hintText: 'Digite a descrição',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconButton(
                  onPressed: () async {
                    //async ora permitir o await rodar
                    final dataEscolhida = await showDatePicker(
                      //await espera o usuario inserir p armazenar na var
                      //seletor de datas
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                    );
                    if (dataEscolhida != null) {
                      // != DIFERENTE
                      setState(() {
                        data =
                            dataEscolhida; //para forçar a tribuir um novo valor na variavel.
                      });
                    }
                  },
                  icon: Icon(Icons.date_range),
                ),
                Text(widget.tarefas.formatadorDeData.format(data)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconButton(
                  onPressed: () async {
                    final horaEscolhida = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());

                    if (horaEscolhida != null) {
                      // != DIFERENTE
                      setState(() {
                        hora = horaEscolhida;
                      });
                    } //fim do IF
                  }, //fim ASYNC
                  icon: Icon(Icons.alarm),
                ),
                Text(hora.format(context)),
              ],
            ),
          ),
          Container(
              width: 150,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  var tarefa = Tarefa(
                    titulo: tituloController.text,
                    descricao: descricaoController.text,
                    data: data,
                    hora: hora,
                  );
                  widget.tarefas.adicionarTarefa(tarefa);
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green.shade400)),
              ))
        ],
      ),
    );
  }
}
