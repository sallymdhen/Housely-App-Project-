import 'package:flutter_application_team2/feature/details_screen/data/estate_feature_model.dart';

class EstateFeatureData {

  static List<EstateFeatureModel> features = [
    EstateFeatureModel(
      title: 'Bedrooms',
      value: '3',
      icon: 'assets/icons/bed.png',
    ),

    EstateFeatureModel(
      title: 'Bathub',
      value: '2',
      icon: 'assets/icons/bathroom.png',
    ),

    EstateFeatureModel(
      title: 'Area',
      value: '1,880 sqft',
      icon: 'assets/icons/area.png',
    ),

    EstateFeatureModel(
      title: 'Build',
      value: '2020',
    ),

    EstateFeatureModel(
      title: 'Parking',
      value: '1 Indoor',
    ),

    EstateFeatureModel(
      title: 'Status',
      value: 'For Rent',
    ),
  ];
}