import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:table_calendar/table_calendar.dart';

///==============================================================
/// هذا الملف مسؤول فقط عن تصميم أيام التقويم.
/// لا يحتوي على TableCalendar وإنما يعيد CalendarBuilders
/// ليتم استخدامها داخل calendar_body.dart
///==============================================================
CalendarBuilders buildCalendarBuilders({
  required DateTime? rangeStart,
  required DateTime? rangeEnd,
  required List<DateTime> bookedDays,
}) {

  ///----------------------------------------------------------
  /// التحقق إذا كان اليوم موجود ضمن الأيام المحجوزة
  ///----------------------------------------------------------
  bool isBooked(DateTime day) {
    return bookedDays.any((d) => isSameDay(d, day));
  }

  return CalendarBuilders(

    ///----------------------------------------------------------
    /// رسم الأيام العادية داخل الشهر
    ///----------------------------------------------------------
    defaultBuilder: (context, day, focusedDay) {
      return _dayWidget(
        day: day,

        // هل اليوم محجوز؟
        isBooked: isBooked(day),

        // هل هو بداية الرينج؟
        isStart: isSameDay(day, rangeStart),

        // هل هو نهاية الرينج؟
        isEnd: isSameDay(day, rangeEnd),

        // هل يقع بين البداية والنهاية؟
        isWithinRange:
            rangeStart != null &&
            rangeEnd != null &&
            day.isAfter(rangeStart) &&
            day.isBefore(rangeEnd),
      );
    },

    ///----------------------------------------------------------
    /// رسم يوم "اليوم الحالي"
    /// سنعامله مثل الأيام العادية لأن التصميم لا يميزه.
    ///----------------------------------------------------------
    todayBuilder: (context, day, focusedDay) {
      return _dayWidget(
        day: day,
        isBooked: isBooked(day),
        isStart: isSameDay(day, rangeStart),
        isEnd: isSameDay(day, rangeEnd),
        isWithinRange:
            rangeStart != null &&
            rangeEnd != null &&
            day.isAfter(rangeStart) &&
            day.isBefore(rangeEnd),
      );
    },
    rangeStartBuilder: (context, day, focusedDay) {
  return _dayWidget(
    day: day,
    isStart: true,
  );
},

rangeEndBuilder: (context, day, focusedDay) {
  return _dayWidget(
    day: day,
    isEnd: true,
  );
},

withinRangeBuilder: (context, day, focusedDay) {
  return _dayWidget(
    day: day,
    isWithinRange: true,
  );
},
    









    ///----------------------------------------------------------
    /// الأيام التي تنتمي للشهر السابق أو التالي
    ///----------------------------------------------------------
    outsideBuilder: (context, day, focusedDay) {
      return Center(
        child: Text(
          '${day.day}',
          style: AppTextStyle.NearbyName.copyWith(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
        ),
      );
    },

    ///----------------------------------------------------------
    /// الأيام المعطلة (الأيام المحجوزة)
    ///----------------------------------------------------------
    disabledBuilder: (context, day, focusedDay) {
      return _dayWidget(
        day: day,
        isBooked: true,
      );
    },
  );
}

///==============================================================
/// هذه الويدجت مسؤولة عن رسم يوم واحد فقط.
/// تستقبل حالة اليوم ثم تحدد اللون المناسب.
///==============================================================
Widget _dayWidget({
  required DateTime day,

  bool isBooked = false,

  bool isStart = false,

  bool isEnd = false,

  bool isWithinRange = false,
  bool isSelected = false,
}) {

  Color? backgroundColor;

  Color textColor = AppColor.blackColor;

  ///----------------------------------------------------------
  /// بداية أو نهاية الرينج
  /// دائرة بنفسجي غامق
  ///----------------------------------------------------------
  if (isStart || isEnd) {
    backgroundColor = AppColor.primaryColor;
    textColor = Colors.white;
  }

  ///----------------------------------------------------------
  /// الأيام الواقعة داخل الرينج
  /// دائرة بنفسجي فاتح
  ///----------------------------------------------------------
  else if (isWithinRange) {
    backgroundColor = const Color(0xFFE9D7FE);
    textColor = Color(0xFF1F2A37);
   // backgroundColor = AppColor.primaryColor.withOpacity(.20);
  }

  ///----------------------------------------------------------
  /// اليوم محجوز
  ///----------------------------------------------------------
  else if (isBooked) {
    backgroundColor = AppColor.greyColor;
    textColor = AppColor.lightgrey;
  }

  ///----------------------------------------------------------
  /// رسم الدائرة الخاصة باليوم
  ///----------------------------------------------------------
  return Center(
    child: Container(
      width: 38,
      height: 38,

      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),

      alignment: Alignment.center,

      child: Text(
        '${day.day}',

        style: AppTextStyle.NearbyName.copyWith(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}