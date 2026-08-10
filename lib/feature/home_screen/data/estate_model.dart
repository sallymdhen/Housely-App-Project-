import 'package:flutter_application_team2/feature/search_screen/data/model/filter_model.dart';

class EstateModel {
  final String? image;
  final String? name;
  final String? location;
  final double? price;
  final double? route;

  // معلومات العقار يلي بدي  أستخدمها في الفلترة
  final PropertyPurpose? purpose;
  final PropertyType? type;
  final List<String> facilityIds;

  EstateModel({
    this.image,
    this.name,
    this.price,
    this.location,
    this.route,
    this.purpose,
    this.type,
    this.facilityIds = const [],
  });
}