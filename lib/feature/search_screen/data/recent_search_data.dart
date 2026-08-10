import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';

class RecentSearchData {
  static List<EstateModel> recent = [];

  static void add(EstateModel estate) {
    recent.removeWhere((e) => e.name == estate.name);
    recent.insert(0, estate);
    if (recent.length > 5) recent.removeLast();
  }
}