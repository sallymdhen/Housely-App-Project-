import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_data.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/view/filter_result_screen.dart';

import '../../../data/model/filter_model.dart';
import 'filter_bottom_sheet.dart';

mixin FilterBottomSheetLogic on State<FilterBottomSheet> {
  late FilterModel filter;

  @override
  void initState() {
    super.initState();
    filter = widget.initialFilter!;
  }

  void togglePurpose(PropertyPurpose purpose, bool value) {
    setState(() {
      final next = {...filter.purposes};
      value ? next.add(purpose) : next.remove(purpose);
      filter = filter.copyWith(purposes: next);
    });
  }

  void toggleType(PropertyType type, bool value) {
    setState(() {
      final next = {...filter.types};
      value ? next.add(type) : next.remove(type);
      filter = filter.copyWith(types: next);
    });
  }

  void toggleFacility(String id) {
    setState(() {
      final next = {...filter.facilityIds};
      next.contains(id) ? next.remove(id) : next.add(id);
      filter = filter.copyWith(facilityIds: next);
    });
  }

  void reset() {
    setState(() => filter = FilterModel.empty());
  }

  void apply() {
  final filteredEstates = EstateData.estates.where((estate) {
    // Property Purpose
    final purposeMatches =
        filter.purposes.isEmpty ||
        (estate.purpose != null && filter.purposes.contains(estate.purpose));

    // Property Type
    final typeMatches =
        filter.types.isEmpty ||
        (estate.type != null && filter.types.contains(estate.type));

    // Price
    final price = estate.price ?? 0;

    final priceMatches =
        price >= filter.priceRange.start &&
        price <= filter.priceRange.end;

    // Facilities
    final facilitiesMatch =
        filter.facilityIds.isEmpty ||
        filter.facilityIds.every(
          (facility) => estate.facilityIds.contains(facility),
        );

    return purposeMatches &&
        typeMatches &&
        priceMatches &&
        facilitiesMatch;
  }).toList();

  Navigator.of(context).pop();

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => FilterResultScreen(
        estates: filteredEstates,
      ),
    ),
  );
}
}
