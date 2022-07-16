// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_ui_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeUIStore on _HomeUIStore, Store {
  late final _$valueAtom = Atom(name: '_HomeUIStore.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_HomeUIStoreActionController =
      ActionController(name: '_HomeUIStore', context: context);

  @override
  void increment(dynamic data) {
    final _$actionInfo = _$_HomeUIStoreActionController.startAction(
        name: '_HomeUIStore.increment');
    try {
      return super.increment(data);
    } finally {
      _$_HomeUIStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
