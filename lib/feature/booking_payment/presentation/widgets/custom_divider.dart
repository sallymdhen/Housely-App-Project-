import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: 0.8,
              child: Container(color: Color(0xFFE5E7EB),),);
  }
}