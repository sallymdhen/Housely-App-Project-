import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/core/widgets/skip_button.dart';

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
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),

            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),

              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 30),

                    Align(
                      alignment: Alignment.centerRight,

                      child: currentIndex != onboardingData.length - 1
                          ? const SkipButton()
                          : const SizedBox.shrink(),
                      //خطأاااا لأن بأخر صفحة بدنا نحذذف  الزر يا سهااام SkipButton(),
                    ),
                    SizedBox(height: 30),

                    SizedBox(
                      height: 500,

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

                    //  SizedBox(height: 5.h),
                    OnboardingIndicator(
                      currentIndex: currentIndex,

                      length: onboardingData.length,
                    ),

                    SizedBox(height: 60),

                    BottomButton(
                      title: currentIndex == onboardingData.length - 1
                          ? "Get Started"
                          : "Next",

                      onPressed: nextPage,
                    ),

                    //  SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
