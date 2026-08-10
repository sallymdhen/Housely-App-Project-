import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/search_screen/data/model/filter_model.dart';

class EstateData {
  static List<EstateModel> estates = [
    EstateModel(
      image: 'assets/image/estate_one.png',
      name: 'Ayana Homestay',
      price: 310,
      location: 'Imogiri, Yogyakarta',
      route: 4.5,
      purpose: PropertyPurpose.forRent,
      type: PropertyType.villa,
      facilityIds: ['wifi', 'ac', 'bedroom'],
    ),

    EstateModel(
      image: 'assets/image/estate_two.png',
      name: 'Downtown Boul',
      price: 520,
      location: 'Amman',
      route: 2.3,
      purpose: PropertyPurpose.forSale,
      type: PropertyType.apartment,
      facilityIds: ['wifi', 'bathub'],
    ),

    EstateModel(
      image: 'assets/image/estate_three.png',
      name: 'Modren Townhouse',
      price: 611,
      location: 'Golden squere, New Cario',
      route: 4.5,
      purpose: PropertyPurpose.forRent,
      type: PropertyType.penthouse,
      facilityIds: ['wifi', 'ac', 'bathub'],
    ),

    EstateModel(
      image: 'assets/image/estate_four.png',
      name: 'premium villa',
      price: 273,
      location: 'Al_yasmin district',
      route: 4.7,
      purpose: PropertyPurpose.forSale,
      type: PropertyType.villa,
      facilityIds: ['ac', 'bedroom'],
    ),

    EstateModel(
      image: 'assets/image/estate_ten.jpg',
      name: 'Houston',
      price: 210,
      location: 'texsas.jl US',
      route: 4.5,
      purpose: PropertyPurpose.forRent,
      type: PropertyType.hotel,
      facilityIds: ['wifi', 'bathub', 'ac'],
    ),

    EstateModel(
      image: 'assets/image/estate_eleven.jpg',
      name: 'happy land',
      price: 120,
      location: 'jl.london palajar',
      route: 1.7,
      purpose: PropertyPurpose.forRent,
      type: PropertyType.apartment,
      facilityIds: ['wifi', 'bedroom'],
    ),

    EstateModel(
      image: 'assets/image/estate_twelve.jpg',
      name: 'hottel Emma',
      price: 398,
      location: 'san Antonio',
      route: 6.7,
      purpose: PropertyPurpose.forSale,
      type: PropertyType.hotel,
      facilityIds: ['wifi', 'bathub'],
    ),
  ];


  //////////
static List<EstateModel> nearByEstate = [
  EstateModel(
    image: 'assets/image/estate_five.png',
    name: 'maharani villa',
    price: 380,
    location: 'Benhil, jl.Bendug',
    route: 4.5,
    purpose: PropertyPurpose.forRent,
    type: PropertyType.villa,
    facilityIds: ['wifi', 'ac', 'bedroom'],
  ),

  EstateModel(
    image: 'assets/image/estate_seven.jpg',
    name: 'green valley',
    price: 210,
    location: 'Menteny.jl thamirin',
    route: 4.5,
    purpose: PropertyPurpose.forSale,
    type: PropertyType.apartment,
    facilityIds: ['wifi', 'bathub'],
  ),

  EstateModel(
    image: 'assets/image/estate_eight.jpg',
    name: 'Azure beach front',
    price: 310,
    location: 'Ancol,jl.panta india',
    route: 4.5,
    purpose: PropertyPurpose.forRent,
    type: PropertyType.penthouse,
    facilityIds: ['wifi', 'ac'],
  ),

  EstateModel(
    image: 'assets/image/estate_nine.jpg',
    name: 'Apartement land',
    price: 520,
    location: 'jl.tentara palajar',
    route: 4.7,
    purpose: PropertyPurpose.forSale,
    type: PropertyType.apartment,
    facilityIds: ['wifi', 'ac', 'bathub'],
  ),
];
}