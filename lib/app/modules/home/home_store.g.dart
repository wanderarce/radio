// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$radiosAtom = Atom(name: 'HomeStoreBase.radios');

  @override
  List<Radios> get radios {
    _$radiosAtom.reportRead();
    return super.radios;
  }

  @override
  set radios(List<Radios> value) {
    _$radiosAtom.reportWrite(value, super.radios, () {
      super.radios = value;
    });
  }

  @override
  String toString() {
    return '''
radios: ${radios}
    ''';
  }
}
