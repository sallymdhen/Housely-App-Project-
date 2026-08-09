import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

import 'searchTheme.dart';

class PriceRangeSlider extends StatelessWidget {
  final RangeValues values;
  final double min;
  final double max;
  final ValueChanged<RangeValues> onChanged;

  const PriceRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    this.min = 10,
    this.max = 800,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColor.primaryColor,
            inactiveTrackColor: AppColor.border,
            trackHeight: 3,
            thumbColor: AppColor.primaryColor,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayColor: AppColor.primaryColor.withOpacity(0.15),
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 8,
            ),
          ),
          child: RangeSlider(
            values: values,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${min.toInt()}', style: AppTextStyles.subtitle),
              Text('\$${max.toInt()}', style: AppTextStyles.subtitle),
            ],
          ),
        ),
      ],
    );
  }
}
