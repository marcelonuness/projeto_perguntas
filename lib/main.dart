import "package:flutter/material.dart";
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": 5},
        {"texto": "Branco", "pontuacao": 3},
        {"texto": "Verde", "pontuacao": 1},
        {"texto": "Vermelho", "pontuacao": 10}
      ],
    },
    {
      "texto": "Qual é seu animal favorito?",
      "respostas": [
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Cobra", "pontuacao": 5},
        {"texto": "Elefante", "pontuacao": 3},
        {"texto": "Leão", "pontuacao": 1}
      ],
    },
    {
      "texto": "Qual é o seu time favorito?",
      "respostas": [
        {"texto": "São Paulo", "pontuacao": 10},
        {"texto": "Corinthians", "pontuacao": 3},
        {"texto": "Palmeiras", "pontuacao": 1},
        {"texto": "Vasco da Gama", "pontuacao": 5}
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarForm() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarForm),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
