import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/app_color.dart';

class AddContactButton extends StatelessWidget {
  final VoidCallback? onTap;

  AddContactButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.primaryColor,
        ),
        child: Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset("assets/icons/Add.svg"),
          ),
        ),
      ),
    );
  }
}
