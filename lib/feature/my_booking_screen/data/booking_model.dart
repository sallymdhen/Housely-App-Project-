import 'package:flutter_application_team2/feature/booking_payment/data/card_model.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/paypal_model.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_status_type.dart';

class BookingModel {
  final EstateModel estate;

  DateTime checkInDate;
  DateTime checkOutDate;
  BookingStatusType status;

  CardModel? card;
  PaypalModel? paypal;

  BookingModel({
    required this.estate,
    required this.checkInDate,
    required this.checkOutDate,
    required this.status,
    this.card,
    this.paypal,
  });
}
/*
class BookingModel {
  final EstateModel estate;
   DateTime checkInDate;
   DateTime checkOutDate;
  BookingStatusType status;

  BookingModel({
    required this.estate,
    required this.checkInDate,
    required this.checkOutDate,
    required this.status,
  });
}*/