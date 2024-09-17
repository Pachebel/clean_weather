import 'package:clean_weather/app/modules/permission/permission_view.dart';
import 'package:clean_weather/app/modules/permission/permission_view_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PermissionModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<PermissionViewModel>(PermissionViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const PermissionView());
  }
}
