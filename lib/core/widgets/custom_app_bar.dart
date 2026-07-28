import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;
  

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w800),),
      centerTitle: true,
    );
  }
}