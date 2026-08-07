import 'package:flutter/material.dart';

enum PropertyPurpose { forRent, forSale }

enum PropertyType { apartment, penthouse, hotel, villa }

class FilterModel {
  final Set<PropertyPurpose> purposes;
  final Set<PropertyType> types;
  final RangeValues priceRange;
  final Set<String> facilityIds;

  const FilterModel({
    this.purposes = const {PropertyPurpose.forRent},
    this.types = const {PropertyType.apartment, PropertyType.hotel},
    this.priceRange = const RangeValues(10, 500),
    this.facilityIds = const {'bathub'},
  });

  FilterModel copyWith({
    Set<PropertyPurpose>? purposes,
    Set<PropertyType>? types,
    RangeValues? priceRange,
    Set<String>? facilityIds,
  }) {
    return FilterModel(
      purposes: purposes ?? this.purposes,
      types: types ?? this.types,
      priceRange: priceRange ?? this.priceRange,
      facilityIds: facilityIds ?? this.facilityIds,
    );
  }

  static FilterModel empty() => const FilterModel(
    purposes: {},
    types: {},
    priceRange: RangeValues(10, 800),
    facilityIds: {},
  );
}
