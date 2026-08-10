import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/custom_divider.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_status_type.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/booking_action_tile.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/booking_card.dart';
import 'package:go_router/go_router.dart';

class CompletedBookingCard extends StatelessWidget {
  CompletedBookingCard({super.key});

  final BookingModel booking = BookingModel(
    estate:EstateModel(
      image: 'assets/image/estate_two.png',
      name: 'Downtown Boul',
      price: 520,
      location: 'Amman',
      route: 2.3
    ),
    checkInDate: DateTime(2026, 7, 3),
    checkOutDate: DateTime(2026, 7, 5),
    status: BookingStatusType.completed,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookingCard(
          booking: booking,
        ),

        const SizedBox(height: 10),
        const CustomDivider(),

        BookingActionTile(
          title: 'Write review',
          icon: 'assets/icons/review.png',
          onTap: () {context.push('/review');},
        ),

        const CustomDivider(),
        SizedBox(height: 4,),

        BookingActionTile(
          title: 'Call Agent',
          icon: 'assets/icons/Call.png',
          onTap: () {context.push('/chat',
           extra: {
        'userName': 'Robert',
        'userAvatar': 'assets/image/person9.png',
      },
          );},
        ),
         SizedBox(height: 4,),
        const CustomDivider(),
      ],
    );
  }
}