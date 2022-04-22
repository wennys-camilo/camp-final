import 'package:camp_final/app/modules/login/login_module.dart';

import 'presentation/forgot_passsword_page_one.dart';
import 'presentation/forgot_password_page_two.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgotPasswordModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ForgotPasswordPageOne()),
    ChildRoute('/pageTwo',
        child: (context, args) => const ForgorPasswordPageTwo()),
    ModuleRoute('/login', module: LoginModule())
  ];
}
