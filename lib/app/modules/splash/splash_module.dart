import 'package:flutter_modular/flutter_modular.dart';

import 'controller/splash_controller.dart';
import 'views/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
    i.add(SplashController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
