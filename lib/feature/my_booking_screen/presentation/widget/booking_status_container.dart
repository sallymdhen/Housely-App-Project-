import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class BookingStatus extends StatelessWidget {
  BookingStatus({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int) onTap;
  

  final List<String> tabs = [
    'Upcoming',
    'Completed',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        color: AppColor.lightgrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tabs.length,
          (index) => buildStatus(
            title: tabs[index],
            isSelected: selectedIndex == index,
            onTap: () => onTap(index),
          ),
        ),
      ),
    );
  }

  Widget buildStatus({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container( padding: const EdgeInsets.symmetric(
    horizontal: 14,
    //vertical: 8,
  ),
  alignment: Alignment.center,
      
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? AppColor.whiteColor
                : AppColor.greyColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}