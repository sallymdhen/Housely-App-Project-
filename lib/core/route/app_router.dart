//import 'package:flutter_application_team2/feature/auth/presentation/view/Register.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/Register.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/create_new_password.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/forgot_password.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/login.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/password_changed.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/card_model.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/paypal_model.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/view/add_new_card_screen.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/view/paypal_screen.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/view/reserve_screen.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_bottom_sheet.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/succes_pay_sheet.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/view/details_screen.dart';
//import 'package:flutter_application_team2/feature/explore_screen/presentation/view/explore_screen.dart';
import 'package:flutter_application_team2/feature/favorite_screen/presentation/view/favorite_screen.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/view/home_screen.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/view/popular_screen.dart';
import 'package:flutter_application_team2/feature/message_screen/presentation/message_models&widgets/message_widgets/DeleteConfirmationSheet.dart';
import 'package:flutter_application_team2/feature/message_screen/presentation/view/chatScreen.dart';
import 'package:flutter_application_team2/feature/message_screen/presentation/view/message_screen.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/view/my_booking_screen.dart';
import 'package:flutter_application_team2/feature/navigation/presentation/view/main_screen.dart';
import 'package:flutter_application_team2/feature/notification/presentation/view/notification_screen.dart';
import 'package:flutter_application_team2/feature/profile_screen/presentatoin/view/edit_profile_screen.dart';
import 'package:flutter_application_team2/feature/profile_screen/presentatoin/view/profile_screen.dart';
import 'package:flutter_application_team2/feature/review/view/write_review_screen.dart';
import 'package:flutter_application_team2/feature/search_screen/data/model/filter_model.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/view/filter_result_screen.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/view/search_screen.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/widget/search_widget/filter_bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_team2/feature/location/presentation/view/choose_location_screen.dart';
import 'package:flutter_application_team2/feature/location/presentation/view/location_permission_screen.dart';
import 'package:flutter_application_team2/feature/onboarding/presentation/view/onboarding_screen.dart';
import '../../feature/auth/presentation/view/verify_email.dart';
import 'package:flutter_application_team2/feature/splash/presentation/view/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

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
            builder: (context, state) => const ChooseLocationScreen(),
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

      //GoRoute(
        //path: '/chat',
        //builder: (context, state) => const ListChatScreen(),
      //),

      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),

      

      GoRoute(
        path: '/details',
        builder: (context, state) =>
            DetailsScreen(estate: state.extra as EstateModel),
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
        path: '/explore',
        builder: (context, state) => const ChooseLocationScreen(),
      ),

      GoRoute(
        path: '/reserve',
        builder: (context, state) {
          final estate = state.extra as EstateModel;

          return ReserveScreen(estate: estate);
        },
      ),

      GoRoute(
        path: '/reserveData',
        builder: (context, state) => const CalendarBottomSheet(),
      ),

      GoRoute(
        path: '/addNewCard',
        builder: (context, state) {
          return AddNewCardScreen(card: state.extra as CardModel?);
        },
      ),

      GoRoute(
  path: '/filter-result',
  builder: (context, state) {
    final estates = state.extra as List<EstateModel>;

    return FilterResultScreen(
      estates: estates,
    );
  },
),

      GoRoute(
        path: '/paypal',
        builder: (context, state) {
          return PaypalScreen(paypal: state.extra as PaypalModel?);
        },
      ),

      GoRoute(
        path: '/reserveSucces',
        builder: (context, state) => const SuccesPaySheet(),
      ),
      GoRoute(//
        path: '/message',
        builder: (context, state) => const MessageScreen(),
      ),

      GoRoute(
        path: '/chat',
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;

          return ChatDetailScreen(
            userName: extraData?['userName'] ?? '',
            userAvatar: extraData?['userAvatar'] ?? '',
          );
        },
      ),

      GoRoute(
 path: '/DeleteConfirmationSheet',
 builder: (context, state) => DeleteConfirmationSheet(),
),

GoRoute(
        path: '/review',
        builder: (context, state) => const WriteReviewScreen(),
      ),







    ],
  );










}