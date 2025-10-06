import 'package:flutter_modular/flutter_modular.dart';
import 'views/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/", child: (_) => HomePage());
  }
}
