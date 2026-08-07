//هي مكان مؤؤقت مننشااان خززن الحجوزات
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_model.dart';

class BookingManager {

  static final List<BookingModel> bookings = [];

//بس هون عم أتأكد اذا العقار محجوز او لا لحتى ما يتكرر بس 
  static BookingModel? getBookingByEstate(EstateModel estate) {

    try {
      return bookings.firstWhere(
        (booking) => booking.estate.name == estate.name,
      );

    } catch (e) {
      return null;
    }

  }

}