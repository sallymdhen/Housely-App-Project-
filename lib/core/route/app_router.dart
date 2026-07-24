import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/location/presentation/view/choose_location_screen.dart';
import 'package:flutter_application_team2/feature/location/presentation/view/location_permission_screen.dart';
import 'package:flutter_application_team2/feature/onboarding/presentation/view/onboarding_screen.dart';

import '../../feature/auth/presentation/view/create_new_password.dart';
import '../../feature/auth/presentation/view/forgot_password.dart';
import '../../feature/auth/presentation/view/login.dart';
import '../../feature/auth/presentation/view/password_changed.dart';
import '../../feature/auth/presentation/view/verify_email.dart';
import 'package:flutter_application_team2/feature/splash/presentation/view/splash_screen.dart';
//import 'package:flutter_application_team2/feature/onboarding/presentation/view/onboarding_screen.dart' ;

class AppRoutes {
  static const String login = "/login";

  static const String forgotPassword = "/forgotPassword";

  static const String verifyEmail = "/verifyEmail";

  static const String createNewPassword = "/createNewPassword";

  static const String passwordChanged = "/passwordChanged";

  static const String splash = "/splash";

  static const String onboarding = "/onboarding";

  static const chooseLocation = "/chooseLocation";

  static const permissionLocation = "/permissionLocation";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const Login());

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());

      case verifyEmail:
        return MaterialPageRoute(builder: (_) => const VerifyEmail());

      case createNewPassword:
        return MaterialPageRoute(builder: (_) => const CreateNewPassword());

      case passwordChanged:
        return MaterialPageRoute(builder: (_) => const PasswordChanged());

      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case AppRoutes.permissionLocation:
        return MaterialPageRoute(
          builder: (_) => const LocationPermissionScreen(),
        );

      case AppRoutes.chooseLocation:
        return MaterialPageRoute(builder: (_) => const ChooseLocationScreen());

      //case login:
      //      return MaterialPageRoute(builder: (_) => const Login());
    }

    return null;
  }
}
