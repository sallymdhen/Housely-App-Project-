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
import 'package:flutter_application_team2/feature/profile_screen/presentation/view/profile_screen.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/view/search_screen.dart';


import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) =>  HomeScreen(),
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
  builder: (context, state) {
    return DetailsScreen(
      estate: state.extra as EstateModel,
    );
  },
),



    ],
  );
}