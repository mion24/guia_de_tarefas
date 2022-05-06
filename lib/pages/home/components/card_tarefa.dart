import 'package:flutter/material.dart';

class CardTarefa extends StatelessWidget {
  const CardTarefa({Key? key}) : super(key: key);

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
              child: Text('Titulo'), //alinhando somente o text titulo no meio
              alignment: Alignment.center,
            ),
            Text('Descrição'),
            Text('Data'),
            Text('Hora'),
          ],
        ),
      ),
    );
  }
}
