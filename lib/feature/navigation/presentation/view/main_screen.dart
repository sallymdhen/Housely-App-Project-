import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/navigation/presentation/widget/custom_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}