import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/share_item_model.dart';

class ShareItem extends StatelessWidget {
  const ShareItem({
    super.key,
    required this.item,
  });

  final ShareItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          item.image,
          width: 56.w,
          height: 56.w,
        ),
        SizedBox(height: 8.h),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}