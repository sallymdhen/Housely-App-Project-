import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColor.border,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
