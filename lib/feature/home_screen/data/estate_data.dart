import 'estate_model.dart';

import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';

class EstateData {

static List<EstateModel> estates = [
    EstateModel(
      image: 'assets/image/estate_one.png',
      name: 'Ayana Homestay',
      price: 310,
      location: 'Imogiri, Yogyakarta',
      route: 4.5
    ),

    EstateModel(
      image: 'assets/image/estate_two.png',
      name: 'Downtown Boul',
      price: 520,
      location: 'Amman',
      route: 2.3
    ),

    EstateModel(
      image: 'assets/image/estate_three.png',
      name: 'Modren Townhouse',
      price: 611,
      location: 'Golden squere ,New Cario',
      route: 4.5
     
    ),

    EstateModel(
      image: 'assets/image/estate_four.png',
      name: 'premium villa',
      price: 273,
      location: 'Al_yasmin district',
      route: 4.7
     
    ),

    EstateModel(
      image: 'assets/image/estate_ten.jpg',
      name: 'Houston',
      price: 210,
      location: 'texsas.jl US',
      route: 4.5
    ),


       EstateModel(
      image: 'assets/image/estate_eleven.jpg',
      name: 'happy land',
      price: 120,
      location: 'jl.london palajar',
      route: 1.7
    ),
    
    EstateModel(
      image: 'assets/image/estate_twelve.jpg',
      name: 'hottel Emma',
      price: 398,
      location: 'san Antonio',
      route: 6.7
    ),








  ];




}