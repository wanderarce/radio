import 'package:flutter_modular/flutter_modular.dart';
import 'package:radio/app/modules/radios/radios_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute("/plus", module: RadiosModule()),
  ];
}
