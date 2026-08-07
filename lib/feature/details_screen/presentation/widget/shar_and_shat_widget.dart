import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final String img;
  final VoidCallback? onTap;

  const ActionIcon({
    super.key,
    required this.img,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: const Color(0xff8B5CF6).withOpacity(0.12),
          shape: BoxShape.circle,
        ),
         child: Center(
         child: Image.asset(
      img,
      width: 20,
      height: 20,
      fit: BoxFit.contain,
    ),
      ),
    ));
  }
}