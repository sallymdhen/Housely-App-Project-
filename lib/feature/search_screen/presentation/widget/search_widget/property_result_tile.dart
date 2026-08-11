import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';

import '../../../../../core/constant/app_color.dart';
import 'searchTheme.dart';

class PropertyResultTile extends StatelessWidget {
  final EstateModel property;
  final String highlight;
  final VoidCallback? onTap;

  const PropertyResultTile({
    super.key,
    required this.property,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(
                Icons.location_on_outlined,
                size: 18,
                color: AppColor.iconInactive,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.name ?? '', style: AppTextStyles.body),
                  const SizedBox(height: 2),
                  _HighlightedLocation(
                    text: property.location ?? '',
                    highlight: highlight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HighlightedLocation extends StatelessWidget {
  final String text;
  final String highlight;

  const _HighlightedLocation({required this.text, required this.highlight});

  @override
  Widget build(BuildContext context) {
    if (highlight.isEmpty) {
      return Text(text, style: AppTextStyles.subtitle);
    }
    final index = text.toLowerCase().indexOf(highlight.toLowerCase());
    if (index == -1) {
      return Text(text, style: AppTextStyles.subtitle);
    }
    final before = text.substring(0, index);
    final match = text.substring(index, index + highlight.length);
    final after = text.substring(index + highlight.length);

    return RichText(
      text: TextSpan(
        style: AppTextStyles.subtitle,
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
