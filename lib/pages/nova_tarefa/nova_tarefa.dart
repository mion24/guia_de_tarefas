import 'package:flutter/material.dart';
import 'package:guia_de_tarefas/pages/nova_tarefa/tarefas.dart';

class NovaTarefa extends StatefulWidget {
  const NovaTarefa({Key? key}) : super(key: key);

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  @override
  var tarefas = Tarefas(); //usar ctrl . pra importar o arquivo extra
  var data = DateTime.now();
  var hora = TimeOfDay.now(); //hora do dia atual

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
                Text(tarefas.formatadorDeData.format(data)),
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
        ],
      ),
    );
  }
}
