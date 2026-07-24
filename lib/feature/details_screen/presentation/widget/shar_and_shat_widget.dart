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
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xff8B5CF6).withOpacity(0.12),
          shape: BoxShape.circle,
        ),
         child: Center(
         child: Image.asset(
      img,
      width: 24,
      height: 24,
      fit: BoxFit.contain,
    ),
      ),
    ));
  }
}