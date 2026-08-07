import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

import '../../presentation/widget/search_widget/searchTheme.dart';

class FilterActionBar extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onApply;

  const FilterActionBar({required this.onReset, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColor.border)),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: onReset,
            child: Text(
              'Reset',
              style: TextStyle(
                color: AppColor.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: onApply,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Apply',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
