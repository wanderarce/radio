import 'package:radio/app/modules/radios/radios_Page.dart';
import 'package:radio/app/modules/radios/radios_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RadiosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RadiosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RadiosPage()),
  ];
}
