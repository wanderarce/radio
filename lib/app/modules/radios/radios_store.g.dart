// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radios_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RadiosStore on _RadiosStoreBase, Store {
  final _$radioAtom = Atom(name: '_RadiosStoreBase.radio');

  @override
  Radios? get radio {
    _$radioAtom.reportRead();
    return super.radio;
  }

  @override
  set radio(Radios? value) {
    _$radioAtom.reportWrite(value, super.radio, () {
      super.radio = value;
    });
  }

  @override
  String toString() {
    return '''
radio: ${radio}
    ''';
  }
}
