import 'package:mobx/mobx.dart';
import 'package:radio/app/modules/database/database_helper.dart';
import 'package:radio/app/modules/entities/radios.dart';

part 'radios_store.g.dart';

class RadiosStore = _RadiosStoreBase with _$RadiosStore;

abstract class _RadiosStoreBase with Store {
  @observable
  Radios? radio;

  @action
  init() {
    radio = Radios();
  }

  validName() {
    if (radio == null || radio!.name == null || radio!.name!.isEmpty)
      return "Informe um  nome para sua rádio!";
  }

  validUrl() {
    if (radio == null || radio!.name == null || radio!.name!.isEmpty)
      return "Informe a url da rádio desejada!";
  }

  add() {
    if (radio != null) {
      if (radio!.id != null) {
        DatabaseHelper().update(radio!);
      } else {
        DatabaseHelper().store(radio!.name!, radio!.url!);
      }
    }
  }
}
