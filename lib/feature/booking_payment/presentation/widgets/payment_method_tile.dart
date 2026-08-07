import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/shar_and_shat_widget.dart';

class PaymentMethodTile extends StatelessWidget {
  PaymentMethodTile({super.key, required this.imgPath, required this.title,this.onTap,  this.isAdded=false});
  final String imgPath;
  final String title;
  void Function()? onTap;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Container(
        child: Row(
          children: [
            ActionIcon(img: imgPath),
            SizedBox(width: 16),
            Text(
              title,
              style: AppTextStyle.descriptionTextStyle.copyWith(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(child: SizedBox()),
            Icon(Icons.add, color: AppColor.lightgrey),
          ],
        ),
      ),
    );
  }
}
