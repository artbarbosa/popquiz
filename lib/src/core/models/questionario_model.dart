class QuestionarioModel {
  late int? id;
  late String? titulo;
  late List<Questoes> questoes;
  bool? respondido = false;

  // Seleciona se o Questionario foi Respondido ou não
  isRespondido() {
    if (respondido == false) {
      respondido = true;
      return respondido;
    } else if (respondido == true) {
      respondido = false;
      return respondido;
    }
  }

  QuestionarioModel({this.id, this.titulo, required this.questoes});

  //Transforma Json em QuestionarioModel
  QuestionarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    if (json['questoes'] != null) {
      questoes = <Questoes>[];
      json['questoes'].forEach((v) {
        questoes.add(Questoes.fromJson(v));
      });
    }
  }

  //Transforma QuestionarioModel em Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    if (questoes != null) {
      data['questoes'] = questoes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questoes {
  int? id;
  String? titulo;
  String? descricao;
  String? resposta;

  Questoes({this.id, this.titulo, this.descricao});

  //Adiciona resposta respectivamente ao id
  String? addResposta(int indexId, String value) {
    if (indexId == id) {
      resposta = value;
    }
  }

  //Transforma Json em Questoes
  Questoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
  }

  //Transforma Questoes em Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    return data;
  }
}
