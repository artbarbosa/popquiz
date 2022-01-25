import 'package:popquiz/src/core/models/questionario_model.dart';

abstract class IRepository {
  Future<List<QuestionarioModel>> getQuestionarios();
}
