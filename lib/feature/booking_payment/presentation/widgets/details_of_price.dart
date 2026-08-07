import 'package:flutter/material.dart';

class DetailsOfPrice extends StatelessWidget {
   DetailsOfPrice({super.key, required this.title, required this.value,  this.isTotal=false, });
   final String title;
  final String value;
  final bool isTotal ;

  @override
  Widget build(BuildContext context) {
    return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: isTotal ? Colors.black : Colors.grey,
          fontWeight:
              isTotal ? FontWeight.bold : FontWeight.w400,
        ),
      ),

      Text(
        value,
        style: TextStyle(
          fontSize: isTotal ? 28 : 16,
          color: isTotal ? const Color(0xff6941C6) : Colors.black,
          fontWeight:
              isTotal ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    ],
  )
    ;
  }
}