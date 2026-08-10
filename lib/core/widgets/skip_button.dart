import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkipButton extends StatelessWidget {
  //final VoidCallback onPressed;

  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go('/home');
      },

      style: TextButton.styleFrom(
        backgroundColor: Colors.white,

        side: BorderSide(color: Colors.grey.shade300, width: 1),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),

        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),

        minimumSize: Size.zero,

        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),

      child: Text(
        "Skip",

        style: TextStyle(
          fontSize: 11,

          color: Colors.grey.shade600,

          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
