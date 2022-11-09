import "package:flutter/material.dart";
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
    setState(() {
      _perguntaSelecionada++;
    });      
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Perguntas"),
          ),
          body: temPerguntaSelecionada ? 
          Questionario(
            perguntas: _perguntas, 
            perguntaSelecionada: _perguntaSelecionada, 
            responder: _responder) : Resultado(),
        ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
