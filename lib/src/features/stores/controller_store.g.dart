// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerStore on _ControllerStore, Store {
  final _$respondidoAtom = Atom(name: '_ControllerStore.respondido');

  @override
  bool? get respondido {
    _$respondidoAtom.reportRead();
    return super.respondido;
  }

  @override
  set respondido(bool? value) {
    _$respondidoAtom.reportWrite(value, super.respondido, () {
      super.respondido = value;
    });
  }

  final _$_ControllerStoreActionController =
      ActionController(name: '_ControllerStore');

  @override
  dynamic isRespondido(QuestionarioModel questionarioModel) {
    final _$actionInfo = _$_ControllerStoreActionController.startAction(
        name: '_ControllerStore.isRespondido');
    try {
      return super.isRespondido(questionarioModel);
    } finally {
      _$_ControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
respondido: ${respondido}
    ''';
  }
}
