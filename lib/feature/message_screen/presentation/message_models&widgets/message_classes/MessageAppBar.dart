import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/app_color.dart';

class MessageAppBar extends AppBar {
  MessageAppBar({
    super.key,
    VoidCallback? onBackPressed,
    VoidCallback? onSearchPressed,
  }) : super(
         backgroundColor: AppColor.whiteColor,
         elevation: 0,
         centerTitle: true,
         leading: Padding(
           padding: const EdgeInsets.only(left: 24),
           child: GestureDetector(
             onTap: onBackPressed,
             child: Center(
               child: SvgPicture.asset(
                 "assets/icons/back.svg",
                 width: 30,
                 height: 30,
               ),
             ),
           ),
         ),
         title: Text(
           'Message',
           style: TextStyle(
             color: AppColor.blackColor,
             fontSize: 20,
             fontWeight: FontWeight.w600,
             fontFamily: AppFonts.inter,
           ),
         ),
         actionsPadding: const EdgeInsets.only(right: 24.0),
         actions: [
           InkWell(
             onTap: onSearchPressed,
             child: SvgPicture.asset("assets/icons/Search.svg"),
           ),
         ],
       );
}
