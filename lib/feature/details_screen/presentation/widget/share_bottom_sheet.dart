import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/details_screen/data/share_data.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/share_item.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
           Container(
      width: 42,
      height: 6,
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(100),
      ),
    ),

    const SizedBox(height: 16),

    Text(
      'Share to',
      style: AppTextStyle.NearbyName.copyWith(fontSize: 16), 
    ),

    const SizedBox(height: 32),



          GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shareItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            childAspectRatio: .9,
          ),
          itemBuilder: (context, index) {
            return ShareItem(
              item: shareItems[index],
            );
          },
        ),


        ] 
      ),
    );
  }
}