// lib/models/property_model.dart

/// Represents a single property/hotel returned in the search results list.
class PropertyModel {
  final String name;
  final String location;

  const PropertyModel({
    required this.name,
    required this.location,
  });
}
