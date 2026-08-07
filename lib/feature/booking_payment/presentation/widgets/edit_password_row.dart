import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:go_router/go_router.dart';

class EditPasswordRow extends StatelessWidget {
   EditPasswordRow({super.key, required this.imgPath, required this.title,required this.onTap});
  final String imgPath;
  final String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return   Container(
        child: Row(
          children: [
            Image.asset(imgPath,width: 41,height: 32,),
            SizedBox(width: 16),
            Text(
              title,
              style: AppTextStyle.descriptionTextStyle.copyWith(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: SizedBox()),
            InkWell(child:Text('Edit',style:AppTextStyle.authTitle.copyWith(fontSize: 14),),onTap:onTap
             //() {
             // context.go('/addNewCard');
           // },
            ),
          ],
        ),
      );
  }
}