import "package:flutter/material.dart";
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        "texto": "Qual é sua cor favorita?",
        "respostas": ["Preto", "Branco", "Verde", "Vermelho"],
      },
      {
        "texto": "Qual é seu animal favorito?",
        "respostas": ["Coelho", "Cobra", "Elefante", "Leão"],
      },
      {
        "texto": "Qual é o seu time favorito?",
        "respostas": ["São Paulo", "Corinthians", "Palmeiras", "Vasco da Gama"],
      },
    ];

    List<Widget> respostas = [];

    for (var textoResp in perguntas[_perguntaSelecionada].cast()["respostas"]) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]["texto"].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
