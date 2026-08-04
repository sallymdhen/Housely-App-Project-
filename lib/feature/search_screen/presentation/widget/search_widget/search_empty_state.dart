import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import 'searchTheme.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _MapMagnifierIllustration(),
          const SizedBox(height: 24),
          const Text(
            'Search not found',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColor.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please enable your location services for\nmore optimal result',
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle,
          ),
        ],
      ),
    );
  }
}

class _MapMagnifierIllustration extends StatelessWidget {
  const _MapMagnifierIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(child: Image.asset("assets/image/search_not_found.png")),
        ],
      ),
    );
  }
}
