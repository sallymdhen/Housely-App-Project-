import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class UploadBox extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool hasImage;

  const UploadBox({
    super.key,
    required this.onTap,
    required this.child,
    this.hasImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: hasImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: child,
              ),
            )
          : DottedBorder(
              color: AppColor.greyColor,
              strokeWidth: 1.3,
              dashPattern: const [3, 3],
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: child,
              ),
            ),
    );
  }
}
