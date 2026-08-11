import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_data.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/SearchResultsBody.dart';
import '../../data/recent_search_data.dart';
import '../widget/search_widget/search_empty_state.dart';
import '../widget/search_widget/search_input_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  String get _query => _controller.text.trim();

  List<EstateModel> get _filteredProperties {
    if (_query.isEmpty) return [];
    return EstateData.estates
        .where(
          (p) =>
              (p.name ?? '').toLowerCase().contains(_query.toLowerCase()) ||
              (p.location ?? '').toLowerCase().contains(_query.toLowerCase()),
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

  Future<void> _openDetails(
    EstateModel estate, {
    required bool saveToRecent,
  }) async {
    if (saveToRecent) RecentSearchData.add(estate);
    await context.push('/details', extra: estate);
    if (mounted) setState(() {}); // عشان قائمة الـ Recent تتحدث لما ترجع
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
              child: _query.isEmpty
                  ? SearchResultsBody(
                      query: _query,
                      recentSearches: RecentSearchData.recent,
                      results: const [],
                      onRecentTap: (e) => _openDetails(e, saveToRecent: false),
                      onResultTap: (e) => _openDetails(e, saveToRecent: true),
                    )
                  : (_hasResults
                        ? SearchResultsBody(
                            query: _query,
                            recentSearches: const [],
                            results: _filteredProperties,
                            onRecentTap: (e) =>
                                _openDetails(e, saveToRecent: false),
                            onResultTap: (e) =>
                                _openDetails(e, saveToRecent: true),
                          )
                        : const Center(child: SearchEmptyState())),
            ),
          ],
        ),
      ),
    );
  }
}
