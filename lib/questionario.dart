import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Cast ajustado para a nova estrutura
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? (perguntas[perguntaSelecionada]['respostas'] as List<dynamic>)
            .cast<Map<String, Object>>()
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        // Mapeamento ajustado para acessar o 'texto' e 'nota'
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => quantoResponder(
                resp['pontuacao'] as int), // Aqui corrigimos a chave e o cast.
          );
        }).toList(),
      ],
    );
  }
}
