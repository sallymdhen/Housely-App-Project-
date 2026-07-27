import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/Register.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/login.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/view/details_screen.dart';
import 'package:flutter_application_team2/feature/explore_screen/presentation/view/explore_screen.dart';
import 'package:flutter_application_team2/feature/favorite_screen/presentation/view/favorite_screen.dart';
import 'package:flutter_application_team2/feature/filtter_screen/presentation/view/filtter_screen.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/view/home_screen.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/view/popular_screen.dart';
import 'package:flutter_application_team2/feature/list_chat_screen/presentation/view/list_chat_screen.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/view/my_booking_screen.dart';
import 'package:flutter_application_team2/feature/navigation/presentation/view/main_screen.dart';
import 'package:flutter_application_team2/feature/notification_screen/presentation/view/notification_screen.dart';
import 'package:flutter_application_team2/feature/profile_screen/presentatoin/view/edit_profile_screen.dart';
import 'package:flutter_application_team2/feature/profile_screen/presentatoin/view/profile_screen.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/view/search_screen.dart';
import 'package:go_router/go_router.dart';

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


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation:'/splash',
    routes: [
     
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      
      GoRoute(
        path: '/register',
        builder: (context, state) => const Register_Screen(),
      ),

      
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: 'popular',
                builder: (context, state) => const PopularScreen(),
              ),
            ],
          ),

          GoRoute(
            path: '/explore',
            builder: (context, state) => const ExploreScreen(),
          ),

          GoRoute(
            path: '/favorite',
            builder: (context, state) => const FavoriteScreen(),
          ),

          GoRoute(
            path: '/my-booking',
            builder: (context, state) => const MyBookingScreen(),
          ),

          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

      GoRoute(
        path: '/notification',
        builder: (context, state) => const NotificationScreen(),
      ),

      GoRoute(
        path: '/chat',
        builder: (context, state) => const ListChatScreen(),
      ),

      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),

      GoRoute(
        path: '/filtter',
        builder: (context, state) => const FiltterScreen(),
      ),

      GoRoute(
        path: '/details',
        builder: (context, state) => DetailsScreen(
          estate: state.extra as EstateModel,
        ),
      ),

      GoRoute(
  path: '/splash',
  builder: (context, state) => const SplashScreen(),
),

GoRoute(
  path: '/onboarding',
  builder: (context, state) => const OnboardingScreen(),
),

GoRoute(
  path: '/forgotPassword',
  builder: (context, state) => const ForgotPassword(),
),

GoRoute(
  path: '/verifyEmail',
  builder: (context, state) => const VerifyEmail(),
),

GoRoute(
  path: '/createNewPassword',
  builder: (context, state) => const CreateNewPassword(),
),

GoRoute(
  path: '/passwordChanged',
  builder: (context, state) => const PasswordChanged(),
),

GoRoute(
  path: '/permissionLocation',
  builder: (context, state) => const LocationPermissionScreen(),
),

GoRoute(
  path: '/chooseLocation',
  builder: (context, state) => const ChooseLocationScreen(),
),
 /*GoRoute(
        path: '/searchEmpty',
        builder: (context, state) => const SearchEmptyScreen(),
      ),*/
/*GoRoute(
        path: '/writeReview',
        builder: (context, state) => const WriteReviewScreen(),
      ),*/
/*GoRoute(
        path: '/uploadPhoto',
        builder: (context, state) => const UploadPhotoScreen(),
      ),*/

/*GoRoute(
        path: '/notificationEmpty',
        builder: (context, state) => const NotificationEmptyScreen(),
      ),*/

/*GoRoute(
        path: '/reserve',
        builder: (context, state) => const ReserveScreen(),
      ),*/      


      /*GoRoute(
        path: '/reserveData',
        builder: (context, state) => const ReserveDataScreen(),
      ),*/      


      /*GoRoute(
        path: '/addNewCard',
        builder: (context, state) => const AddNewCardScreen(),
      ),*/      


      /*GoRoute(
        path: '/reservePay',
        builder: (context, state) => const ReservePayScreen(),
      ),*/  

      /*GoRoute(
        path: '/myServeUNComplete',
        builder: (context, state) => const MyServeUnCompleteScreen(),
      ),*/  


      /*GoRoute(
        path: '/myServeComplete',
        builder: (context, state) => const MyServeCompleteScreen(),
      ),*/   


      /*GoRoute(
        path: '/myServeUNCancel',
        builder: (context, state) => const MyServeUNCancelScreen(),
      ),*/        


/*GoRoute(
        path: '/myServeEmpty',
        builder: (context, state) => const MyServeEmptyScreen(),
      ),*/        

      



















    ],
  );
}
