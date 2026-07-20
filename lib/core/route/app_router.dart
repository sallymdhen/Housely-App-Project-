import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/Register.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/login.dart';
import 'package:flutter_application_team2/feature/home/presentation/view/home.dart';

class AppRoutes {
  // هون بنكتب السطر نفسو بس بنغير بالاسم (login --> اسم الصفحة يل بدنا نضيفها)

  static const String login = '/';
  static const String register = '/register';
  static const String home = '/home';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const Register_Screen());
      // هون ضغري بنضيف ال 2 اسطر يلي بتبلش ب case
      ////////////////////////////////////////////////////////////////
      default: // هي حالة ال error
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

//هون بنكتب التعليمات يلي رح تصير فيها الانتقالات تمام
