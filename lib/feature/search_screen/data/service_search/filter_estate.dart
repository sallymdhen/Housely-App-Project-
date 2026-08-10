import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/search_screen/data/model/filter_model.dart';

class EstateFilter {
  static List<EstateModel> apply({
    required List<EstateModel> estates,
    required FilterModel filter,
  }) {
    return estates.where((estate) {

      
      final price = estate.price ?? 0;

      final matchesPrice =
          price >= filter.priceRange.start &&
          price <= filter.priceRange.end;

      if (!matchesPrice) {
        return false;
      }

      if (filter.purposes.isNotEmpty) {
        if (estate.purpose == null ||
            !filter.purposes.contains(estate.purpose)) {
          return false;
        }
      }

    
      if (filter.types.isNotEmpty) {
        if (estate.type == null ||
            !filter.types.contains(estate.type)) {
          return false;
        }
      }

      
      if (filter.facilityIds.isNotEmpty) {
        final hasAllFacilities = filter.facilityIds.every(
          (facility) => estate.facilityIds.contains(facility),
        );

        if (!hasAllFacilities) {
          return false;
        }
      }

      return true;
    }).toList();
  }
}