import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';

import '../../presentation/widget/search_widget/property_result_tile.dart';
import '../../presentation/widget/search_widget/recent_search_tile.dart';
import '../../presentation/widget/search_widget/searchTheme.dart';

class SearchResultsBody extends StatelessWidget {
  final String query;
  final List<EstateModel> recentSearches;
  final List<EstateModel> results;
  final void Function(EstateModel) onRecentTap;
  final void Function(EstateModel) onResultTap;

  const SearchResultsBody({
    super.key,
    required this.query,
    required this.recentSearches,
    required this.results,
    required this.onRecentTap,
    required this.onResultTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      children: [
        if (recentSearches.isNotEmpty) ...[
          Text('Recent', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 4),
          ...recentSearches.map(
            (r) => RecentSearchTile(
              title: r.name ?? '',
              highlight: query,
              onTap: () => onRecentTap(r),
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (results.isNotEmpty) ...[
          Text('Result', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 4),
          ...results.map(
            (p) => PropertyResultTile(
              property: p,
              highlight: query,
              onTap: () => onResultTap(p),
            ),
          ),
        ],
      ],
    );
  }
}
