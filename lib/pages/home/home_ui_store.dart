import 'package:mobx/mobx.dart';

part 'home_ui_store.g.dart';

// This is the class used by rest of your codebase
class HomeUIStore = _HomeUIStore with _$HomeUIStore;

// The store-class
abstract class _HomeUIStore with Store {
  @observable
  int value = 0;

  @action
  void increment(data) {
    value = data;
  }

}