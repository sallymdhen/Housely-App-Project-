
import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_manager.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_status_type.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/booking_action_tile.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/booking_card.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/booking_empty.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/booking_status_container.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/completedbookingcard.dart';
import 'package:go_router/go_router.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  int selectedIndex = 0;

  List<BookingModel> get filteredBookings {
    switch (selectedIndex) {
      case 0:
        return BookingManager.bookings.where((booking) {
          return booking.status == BookingStatusType.waitingPayment ||
              booking.status == BookingStatusType.checkIn;
        }).toList();

      case 1:
        return BookingManager.bookings.where((booking) {
          return booking.status == BookingStatusType.completed;
        }).toList();

      case 2:
        return BookingManager.bookings.where((booking) {
          return booking.status == BookingStatusType.cancelled;
        }).toList();

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Booking'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            BookingStatus(
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),

            const SizedBox(height: 22),

            Expanded(
  child: selectedIndex == 1
    ? ListView(
        children: [
          CompletedBookingCard(),
        ],
      )
    : filteredBookings.isEmpty
        ? const BookingEmpty()
        : ListView(
          children: [

            ...List.generate(
              filteredBookings.length,
              (index) => Column(
                children: [
                  BookingCard(
                    booking: filteredBookings[index],
                    onBookingCancelled: () {
                      setState(() {});
                    },
                  ),

                  const Divider(),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            
            if (selectedIndex == 2) ...[
              BookingActionTile(
                title: 'Call Agent',
                 icon: 'assets/icons/Call.png',
                 onTap: () {context.push('/message');},),
              const Divider(),
            ],
          ],
        ),
),
          ],
        ),
      ),
    );
  }
}
