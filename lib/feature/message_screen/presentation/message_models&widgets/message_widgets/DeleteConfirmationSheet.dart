import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteConfirmationSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirmDelete;

  const DeleteConfirmationSheet({
    super.key,
    this.title = 'Are you sure you want to\ndelete this message ?',
    this.subtitle = 'the message will be deleted from this\ndevice',
    this.onCancel,
    this.onConfirmDelete,
  });

  static Future<bool> show(BuildContext context) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: AppColor.whiteColor,
      isScrollControlled: true,
      builder: (context) => const DeleteConfirmationSheet(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 28),
            decoration: BoxDecoration(
              color: AppColor.greyColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.deleteButtonSheet,
            ),
            alignment: Alignment.center,
            child: Container(
              width: 100.38,
              height: 100.38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.whiteColor,
              ),
              child: Center(
                child: SizedBox(
                  height: 66,
                  width: 66,
                  child: SvgPicture.asset("assets/image/Delete.svg"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColor.blackColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColor.subtitleText,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: SheetButton(
                  label: 'Cancel',
                  backgroundColor: AppColor.primaryColor,
                  textColor: AppColor.whiteColor,
                  onTap: () {
                    onCancel?.call();
                  },
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: SheetButton(
                  label: 'Delete',
                  backgroundColor: AppColor.whiteColor,
                  textColor: AppColor.subtitleText,
                  onTap: () {
                    onConfirmDelete?.call();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SheetButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const SheetButton({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
