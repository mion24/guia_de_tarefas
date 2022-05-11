import 'package:flutter/material.dart';

class Tarefa {
  Tarefa({this.titulo, this.data, this.descricao, this.hora, String? x});

  String? titulo;
  String? descricao;
  DateTime? data;
  TimeOfDay? hora;
}
