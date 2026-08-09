import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../data/model/facility_model.dart';
import 'searchTheme.dart';

class FacilityCard extends StatelessWidget {
  final FacilityModel facility;
  final bool selected;
  final VoidCallback onTap;

  const FacilityCard({
    super.key,
    required this.facility,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 68,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColor.primaryLight : Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.medium),
          border: Border.all(
            color: selected ? AppColor.primaryColor : AppColor.border,
            width: 1.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              facility.iconPath,
              width: 20,
              height: 20,
              color: selected ? AppColor.primaryColor : AppColor.iconInactive,
              colorBlendMode: BlendMode.srcIn,
            ),
            const SizedBox(height: 4),
            Text(
              facility.label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: selected
                    ? AppColor.primaryColor
                    : AppColor.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
