import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import 'searchTheme.dart';

class FilterCheckboxRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const FilterCheckboxRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(child: Text(label, style: AppTextStyles.body)),
            _SquareCheckbox(value: value),
          ],
        ),
      ),
    );
  }
}

class _SquareCheckbox extends StatelessWidget {
  final bool value;
  const _SquareCheckbox({required this.value});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: value ? AppColor.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: value ? AppColor.primaryColor : AppColor.border,
          width: 1.4,
        ),
      ),
      child: value
          ? const Icon(Icons.check, size: 15, color: Colors.white)
          : null,
    );
  }
}
