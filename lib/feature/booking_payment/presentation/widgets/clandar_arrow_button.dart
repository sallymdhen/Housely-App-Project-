import 'package:flutter/material.dart';

class CalendarArrowButton extends StatelessWidget {
  const CalendarArrowButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 23,
        height: 23,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        child: Icon(
          icon,
          size: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}