import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/route/app_router.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/feature/onboarding/model/onboarding_model.dart';
import 'package:flutter_application_team2/feature/onboarding/presentation/widget/onboarding_indicator.dart';
import 'package:flutter_application_team2/feature/onboarding/presentation/widget/onboarding_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/permissionLocation');
    }
  }

  void skip() {
    _pageController.animateToPage(
      onboardingData.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: skip,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    return OnboardingItem(model: onboardingData[index]);
                  },
                ),
              ),

              OnboardingIndicator(
                currentIndex: currentIndex,
                length: onboardingData.length,
              ),

              SizedBox(height: 50.h),

              BottomButton(
                title: currentIndex == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                onPressed: nextPage,
              ),

              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
