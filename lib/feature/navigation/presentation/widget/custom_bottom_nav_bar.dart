import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF6C4CF1);

    final String location = GoRouterState.of(context).uri.path;

    int currentIndex = 0;

    if (location.startsWith('/chooseLocation')) {
      currentIndex = 1;
    } else if (location.startsWith('/favorite')) {
      currentIndex = 2;
    } else if (location.startsWith('/my-booking')) {
      currentIndex = 3;
    } else if (location.startsWith('/profile')) {
      currentIndex = 4;
    }

    /* final List<IconData> icons = [
      Icons.home_rounded,
      Icons.explore_outlined,
      Icons.favorite_border_rounded,
      Icons.receipt_long_outlined,
      Icons.person_outline_rounded,
    ];*/
    final List<String> normalIcons = [
      'assets/icons/Home.png',
      'assets/icons/Discovery.png',
      'assets/icons/Heart.png',
      'assets/icons/Document.png',
      'assets/icons/Profile.png',
    ];

    final List<String> selectedIcons = [
      'assets/icons/Home_select.png',
      'assets/icons/Discovery.png',
      'assets/icons/Heart_select.png',
      'assets/icons/Document_select.png',
      'assets/icons/Profile._selectpng.png',
    ];

    final List<String> titles = [
      "Home",
       "explore",
      "Favorite",
      "My Booking",
      "Profile",
    ];

    final List<String> routes = [
      "/home",
      "/explore",
      "/favorite",
      "/my-booking",
      "/profile",
    ];

    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(normalIcons.length, (index) {
          final bool selected = currentIndex == index;

         return Expanded(
  child: InkWell(
    onTap: () {
      context.go(routes[index]);
    },
    child: Stack(
      children: [
        if (selected)
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 29,
              height: 3,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                selected ? selectedIcons[index] : normalIcons[index],
                width: 24,
                height: 24,
              ),
              const SizedBox(height: 4),
              Text(
                titles[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected
                      ? AppColor.primaryColor
                      : AppColor.greyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
        }),
      ),
    );
  }
}
