import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_body.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_header.dart';

class BookingCalendar extends StatefulWidget {

  // هذا مثل رسالة رح يبعثها الكالندر للخارج
  final Function(DateTime? start, DateTime? end) onDateSelected;

  const BookingCalendar({
    super.key,
    required this.onDateSelected,
  });

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}


class _BookingCalendarState extends State<BookingCalendar> {

  // الشهر المعروض حالياً
  DateTime focusedDay = DateTime.now();


  // بداية ونهاية الرينج المختار
  DateTime? rangeStart;
  DateTime? rangeEnd;


  // الأيام المحجوزة
  final List<DateTime> bookedDays = [
    DateTime(2026, 7, 3),
    DateTime(2026, 7, 4),
    DateTime(2026, 7, 5),
  ];


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,

      child: Column(
        children: [

          CalendarHeader(
            focusedDay: focusedDay,

            onPrevious: () {
              setState(() {
                focusedDay = DateTime(
                  focusedDay.year,
                  focusedDay.month - 1,
                );
              });
            },


            onNext: () {
              setState(() {
                focusedDay = DateTime(
                  focusedDay.year,
                  focusedDay.month + 1,
                );
              });
            },
          ),


          const SizedBox(height: 16),



          CalendarBody(

            focusedDay: focusedDay,

            rangeStart: rangeStart,

            rangeEnd: rangeEnd,

            bookedDays: bookedDays,


            onRangeChanged: (start, end, focused) {

              setState(() {

                rangeStart = start;

                rangeEnd = end;

                focusedDay = focused;

              });


             
              widget.onDateSelected(
                start,
                end,
              );

            },


            onMonthChanged: (day) {

              setState(() {

                focusedDay = day;

              });

            },

          ),
        ],
      ),
    );
  }
}