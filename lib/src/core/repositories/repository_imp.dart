import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:popquiz/src/core/consts/api_consts.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/core/repositories/repository_interface.dart';
import 'package:popquiz/src/core/utils/api_mock.dart';

class RepositoryImp implements IRepository {
  final Dio dio = DioMock();

  // Pega o questionario da Api Mock JsonData
  @override
  Future<List<QuestionarioModel>> getQuestionarios() async {
    final response = Response(
        requestOptions: RequestOptions(path: ApiConst.apiUrl), data: jsonData);
    final json = await jsonDecode(response.data!);
    final list = json['questionario'] as List<dynamic>;
    return list.map((e) => QuestionarioModel.fromJson(e)).toList();
  }

  //Pega o questionario do assets/mock.json
  //@override
  //Future<List<QuestionarioModel>> getQuestionariosJson() async {
  //final String response = await rootBundle.loadString('assets/mock.json');
  //final json = await jsonDecode(response);
  //final list = json['questionario'] as List;
  //return list.map((e) => QuestionarioModel.fromJson(e)).toList();
  //}

}



/*
  postQuesionary() async {
    QuestionarioModel questionarioModel =
        QuestionarioModel(id: 3, titulo: 'questionario 2', questoes: []);
    final String response = await rootBundle.loadString('assets/mock.json');
    final jsonString = jsonEncode(questionarioModel.toJson());
    final result = response + jsonString;
    json;
    return result;
  }*/