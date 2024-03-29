import 'package:flutter/material.dart';
import 'package:guia_de_tarefas/core/tema/tema.dart';
import 'package:guia_de_tarefas/pages/home/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //desabilitar barra vermelha esquisita
      title: 'Guia de Tarefas ',
      home: Home(),
      theme: temaLight(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('pt', 'BR')],
    );
  }
}
