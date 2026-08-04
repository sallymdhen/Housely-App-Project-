import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/search_screen/data/model/property_model.dart';
import 'package:flutter_application_team2/feature/search_screen/data/model/recent_search_model.dart';

import '../../presentation/widget/search_widget/property_result_tile.dart';
import '../../presentation/widget/search_widget/recent_search_tile.dart';
import '../../presentation/widget/search_widget/searchTheme.dart';

class SearchResultsBody extends StatelessWidget {
  final String query;
  final List<RecentSearchModel> recentSearches;
  final List<PropertyModel> results;

  const SearchResultsBody({
    required this.query,
    required this.recentSearches,
    required this.results,
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
            (r) => RecentSearchTile(title: r.title, highlight: query),
          ),
          const SizedBox(height: 12),
        ],
        Text('Result', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        ...results.map(
          (p) => PropertyResultTile(property: p, highlight: query),
        ),
      ],
    );
  }
}
