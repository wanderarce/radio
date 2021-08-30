import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:radio/app/modules/database/database_helper.dart';
import 'package:radio/app/modules/entities/radios.dart';
import 'package:radio_player/radio_player.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  List<Radios> radios = [];

  RadioPlayer radioPlayer = RadioPlayer();

  @observable
  Radios? currentRadio = Radios();
  @observable
  bool isPlaying = false;
  @observable
  List<String>? metadata;

  @action
  Future<List<Radios>> getRadios() async {
    DatabaseHelper database = DatabaseHelper();
    dynamic res = await database.list();
    if (res != null && res.length > 0) {
      radios = List.from(res).map((e) => Radios.fromJson(e)).toList();
    }
    return radios;
  }

  @action
  Future<bool> playing() {
    return Future.value(isPlaying);
  }

  @action
  void initRadioPlayer(Radios radio) {
    currentRadio = radio;

    radioPlayer.setMediaItem(radio.name!, radio.url!, 'assets/cover.jpg');

    radioPlayer.stateStream.listen((value) {
      isPlaying = value;
      radio.icon = isPlaying == false ? Icons.play_arrow_outlined : Icons.pause;
    });

    radioPlayer.metadataStream.listen((value) {
      metadata = value;
      if (metadata != null) {
        radio.title = metadata![1];
        radio.album = metadata![0];
      }
    });
  }
}
