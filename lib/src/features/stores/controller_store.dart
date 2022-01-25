import 'package:mobx/mobx.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/core/repositories/repository_imp.dart';

part 'controller_store.g.dart';

class ControllerStore = _ControllerStore with _$ControllerStore;

abstract class _ControllerStore with Store {
  @observable
  bool? respondido = false;

  RepositoryImp repository = RepositoryImp();

  late Future<List<QuestionarioModel>> list;

  late Questoes questoes;

  // Marca como Respondido o questionario
  @action
  isRespondido(QuestionarioModel questionarioModel) {
    respondido = questionarioModel.isRespondido();
  }

  // Pede ao repositorio a lista de Questionarios
  getQuestionarios() {
    list = (repository.getQuestionarios());
  }

  // Retorna a lista de Questionairos atualizada
  Future<List<QuestionarioModel>> refreshQuestionaios() {
    return list;
  }

  // Remove um Questionario da lista
  removeQuestionario(List<QuestionarioModel> list, int index) {
    list.removeAt(index);
  }

  addQuestionario(
      List<QuestionarioModel> list, QuestionarioModel questionarioModel) {
    list.add(questionarioModel);
  }

  addQuestao() {}
}
