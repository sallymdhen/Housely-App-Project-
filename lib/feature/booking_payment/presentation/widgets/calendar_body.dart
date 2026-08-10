import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_day_builder.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_weekdays.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_day_builder.dart';

class CalendarBody extends StatelessWidget {
  final DateTime focusedDay;

  final DateTime? rangeStart;
  final DateTime? rangeEnd;
final List<DateTime> bookedDays;
  
  final Function(
    DateTime? start,
    DateTime? end,
    DateTime focusedDay,
  ) onRangeChanged;

  final ValueChanged<DateTime> onMonthChanged;

  const CalendarBody({
    super.key,
    required this.focusedDay,
    required this.rangeStart,
    required this.rangeEnd,
    required this.bookedDays,
    required this.onRangeChanged,
    required this.onMonthChanged,
  });

  /// التحقق إذا كان اليوم محجوزاً مسبقاً
  bool isBooked(DateTime day) {
    return bookedDays.any((d) => isSameDay(d, day));
  }

  /// التحقق إذا كان اليوم داخل الرينج الحالي
  ///
  /// مثال:
  /// rangeStart = 7
  /// rangeEnd   = 10
  ///
  /// 8 و 9 = داخل الرينج
  /// 7 و 10 = ليسا داخل الرينج
  bool isInsideCurrentRange(DateTime day) {
    if (rangeStart == null || rangeEnd == null) {
      return false;
    }

    return day.isAfter(rangeStart!) && day.isBefore(rangeEnd!);
  }

  /// التحقق إذا كان الرينج يحتوي على يوم محجوز مسبقاً
  bool hasBookedDayBetween(DateTime start, DateTime end) {
    DateTime current = start;

    while (!current.isAfter(end)) {
      if (isBooked(current)) {
        return true;
      }

      current = current.add(const Duration(days: 1));
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          /// صف أيام الأسبوع + الديفايدر
          const CalendarWeekDays(),

          /// التقويم
          TableCalendar(
            pageAnimationEnabled: false,

            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2035, 12, 31),

            focusedDay: focusedDay,

            /// إخفاء الهيدر الافتراضي
            headerVisible: false,

            /// عرض شهر فقط
            calendarFormat: CalendarFormat.month,

            /// التنقل بالسحب
            availableGestures: AvailableGestures.horizontalSwipe,

            /// عدم إجبار الشهر على 6 أسابيع
            sixWeekMonthsEnforced: false,

            /// اختيار Range
            rangeSelectionMode: RangeSelectionMode.enforced,

            rangeStartDay: rangeStart,
            rangeEndDay: rangeEnd,

            /// عند اختيار Range
            onRangeSelected: (start, end, focused) {
              if (start != null && end != null) {
                /// إذا كان الرينج يحتوي على أيام محجوزة مسبقاً
                if (hasBookedDayBetween(start, end)) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Booked Dates'),
                      content: const Text(
                        'The selected range contains booked dates.\n'
                        'Please choose another period.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );

                  return;
                }
              }

              /// إرسال الرينج الجديد للخارج
              ///
              /// عندما يتغير الرينج:
              /// rangeStart و rangeEnd يتغيران
              ///
              /// وبالتالي الأيام التي كانت داخل الرينج القديم
              /// تصبح قابلة للضغط من جديد إذا لم تكن محجوزة.
              onRangeChanged(
                start,
                end,
                focused,
              );
            },

            /// عند تغيير الشهر
            onPageChanged: onMonthChanged,

            /// تحديد الأيام القابلة للضغط
            enabledDayPredicate: (day) {
              /// 1. الأيام المحجوزة مسبقاً
              /// ممنوعة دائماً
              if (isBooked(day)) {
                return false;
              }

              /// 2. الأيام الموجودة داخل الرينج الحالي
              /// ممنوعة أثناء وجود الرينج
              ///
              /// مثال:
              /// 7 → 10
              ///
              /// 8 و 9 ممنوعين
              if (isInsideCurrentRange(day)) {
                return false;
              }

              /// 3. Start و End مسموحين
              ///
              /// وباقي الأيام أيضاً مسموحة
              return true;
            },

            /// إخفاء صف أيام الأسبوع الافتراضي
            /// لأننا رسمناه نحن
            daysOfWeekHeight: 0,

            /// ارتفاع كل صف
            rowHeight: 48,

            /// رسم الأيام بواسطة الـBuilder
            calendarBuilders: buildCalendarBuilders(
              rangeStart: rangeStart,
              rangeEnd: rangeEnd,
              bookedDays: bookedDays,
            ),

            calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.zero,

              cellPadding: EdgeInsets.zero,

              /// إلغاء رسم الرينج الافتراضي
              /// لأننا نرسمه بأنفسنا
              rangeHighlightColor: Colors.transparent,

              rangeStartDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),

              rangeEndDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),

              withinRangeDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),

              /// عدم إبراز اليوم الحالي
              isTodayHighlighted: false,

              /// إظهار أيام الشهر السابق والتالي
              outsideDaysVisible: true,

              /// شكل الأيام المعطلة
              disabledTextStyle: TextStyle(
                color: AppColor.lightgrey,
                decoration: TextDecoration.lineThrough,
              ),

              /// شكل الأيام العادية
              defaultTextStyle: AppTextStyle.NearbyName.copyWith(
                fontSize: 16,
                color: AppColor.blackColor,
              ),

              /// شكل أيام نهاية الأسبوع
              weekendTextStyle: AppTextStyle.NearbyName.copyWith(
                fontSize: 16,
                color: AppColor.blackColor,
              ),

              /// شكل أيام الشهر السابق/التالي
              outsideTextStyle: AppTextStyle.NearbyName.copyWith(
                color: AppColor.lightgrey,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_day_builder.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_weekdays.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBody extends StatelessWidget {
  final DateTime focusedDay;

  final DateTime? rangeStart;
  final DateTime? rangeEnd;

  final List<DateTime> bookedDays;

  final Function(DateTime? start, DateTime? end, DateTime focusedDay)
  onRangeChanged;

  final ValueChanged<DateTime> onMonthChanged;

  const CalendarBody({
    super.key,
    required this.focusedDay,
    required this.rangeStart,
    required this.rangeEnd,
    required this.bookedDays,
    required this.onRangeChanged,
    required this.onMonthChanged,
  });

  /// التحقق إذا كان اليوم محجوزاً
  bool isBooked(DateTime day) {
    return bookedDays.any((d) => isSameDay(d, day));
  }

  /// التحقق إذا كان الرينج يحتوي على يوم محجوز
  bool hasBookedDayBetween(DateTime start, DateTime end) {
    DateTime current = start;

    while (!current.isAfter(end)) {
      if (isBooked(current)) {
        return true;
      }

      current = current.add(const Duration(days: 1));
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          /// صف أيام الأسبوع + الديفايدر
          const CalendarWeekDays(),

          /// التقويم
          TableCalendar(
            
            pageAnimationEnabled: false,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2035, 12, 31),
          
            focusedDay: focusedDay,
          
            ///   الهيدر الافتراضي لغيتوووو
            headerVisible: false,
          
            /// عرض شهر فقط
            calendarFormat: CalendarFormat.month,
          
            /// التنقل بالسحب
            availableGestures: AvailableGestures.horizontalSwipe,
          
            /// عدم إجبار الشهر على 6 أسابيع
            sixWeekMonthsEnforced: false,
          
            /// اختيار Range
            rangeSelectionMode: RangeSelectionMode.enforced,
          
            rangeStartDay: rangeStart,
            rangeEndDay: rangeEnd,
          
            onRangeSelected: (start, end, focused) {
              if (start != null && end != null) {
                if (hasBookedDayBetween(start, end)) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Booked Dates'),
                      content: const Text(
                        'The selected range contains booked dates.\nPlease choose another period.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
          
                
                  return;
                }
              }
          
              onRangeChanged(start, end, focused);
            },
          
            onPageChanged: onMonthChanged,
          
            /// منع اختيار الأيام المحجوزة
            enabledDayPredicate: (day) => !isBooked(day),
          
            /// أخفينا صف الأيام الافتراضي لأننا رسمناه نحن
            daysOfWeekHeight: 0,
          
            rowHeight: 48,
          
            /// رسم الأيام بواسطة الـ Builder
            calendarBuilders: buildCalendarBuilders(
              rangeStart: rangeStart,
              rangeEnd: rangeEnd,
              bookedDays: bookedDays,
            ),
          
            calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.zero,
          
              cellPadding: EdgeInsets.zero,
          
              /// إلغاء رسم الرينج الافتراضي
              rangeHighlightColor: Colors.transparent,
              rangeStartDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              rangeEndDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              withinRangeDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
          
              isTodayHighlighted: false,
          
              outsideDaysVisible: true,
          
              disabledTextStyle: TextStyle(
                color: AppColor.lightgrey,
                decoration: TextDecoration.lineThrough,
              ),
          
              defaultTextStyle: AppTextStyle.NearbyName.copyWith(
                fontSize: 16,
                color: AppColor.blackColor,
              ),
          
              weekendTextStyle: AppTextStyle.NearbyName.copyWith(
                fontSize: 16,
                color: AppColor.blackColor,
              ),
          
              outsideTextStyle: AppTextStyle.NearbyName.copyWith(
                color: AppColor.lightgrey,
                //.shade400,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/