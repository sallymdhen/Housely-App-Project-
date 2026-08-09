import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/SearchResultsBody.dart';
import '../../data/model/property_model.dart';
import '../../data/model/recent_search_model.dart';
import '../widget/search_widget/search_empty_state.dart';
import '../widget/search_widget/search_input_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController(
    text: 'Yogya',
  );

  static const List<RecentSearchModel> _recentSearches = [
    RecentSearchModel(title: 'Ambarukmo Plasa'),
  ];

  static const List<PropertyModel> _allProperties = [
    PropertyModel(
      name: 'Greenhost Boutique Hotel',
      location: 'Yogyakarta, Indonesia',
    ),
    PropertyModel(
      name: 'Grand Keisha Yogyakarta',
      location: 'Yogyakarta, Indonesia',
    ),
    PropertyModel(name: 'Jogja Village', location: 'Yogyakarta, Indonesia'),
  ];

  String get _query => _controller.text.trim();

  List<PropertyModel> get _filteredProperties {
    if (_query.isEmpty) return _allProperties;
    return _allProperties
        .where(
          (p) =>
              p.name.toLowerCase().contains(_query.toLowerCase()) ||
              p.location.toLowerCase().contains(_query.toLowerCase()),
        )
        .toList();
  }

  bool get _hasResults => _filteredProperties.isNotEmpty;

  void _clearSearch() {
    if (_controller.text.isNotEmpty) {
      setState(() => _controller.clear());
    } else {
      if (context.canPop()) {
        context.pop();
      } else {
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: SearchInputField(
                      controller: _controller,
                      onChanged: (_) => setState(() {}),
                      onClear: _clearSearch,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Expanded(
              child: _hasResults
                  ? SearchResultsBody(
                      query: _query,
                      recentSearches: _recentSearches,
                      results: _filteredProperties,
                    )
                  : const Center(child: SearchEmptyState()),
            ),
          ],
        ),
      ),
    );
  }
}
