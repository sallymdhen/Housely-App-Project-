import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';

class ThinVerticalDivider extends StatelessWidget {
  ThinVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      color: AppColor.greyColor,
      margin: EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
