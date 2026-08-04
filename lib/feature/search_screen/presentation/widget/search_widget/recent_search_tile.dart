import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import 'searchTheme.dart';

class RecentSearchTile extends StatelessWidget {
  final String title;
  final String highlight;
  final VoidCallback? onTap;

  const RecentSearchTile({
    super.key,
    required this.title,
    this.highlight = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              size: 18,
              color: AppColor.iconInactive,
            ),
            const SizedBox(width: 12),
            _HighlightedText(text: title, highlight: highlight),
          ],
        ),
      ),
    );
  }
}

class _HighlightedText extends StatelessWidget {
  final String text;
  final String highlight;

  const _HighlightedText({required this.text, required this.highlight});

  @override
  Widget build(BuildContext context) {
    if (highlight.isEmpty) {
      return Text(text, style: AppTextStyles.body);
    }
    final index = text.toLowerCase().indexOf(highlight.toLowerCase());
    if (index == -1) {
      return Text(text, style: AppTextStyles.body);
    }
    final before = text.substring(0, index);
    final match = text.substring(index, index + highlight.length);
    final after = text.substring(index + highlight.length);

    return RichText(
      text: TextSpan(
        style: AppTextStyles.body,
        children: [
          TextSpan(text: before),
          TextSpan(
            text: match,
            style: TextStyle(color: AppColor.primaryColor),
          ),
          TextSpan(text: after),
        ],
      ),
    );
  }
}
