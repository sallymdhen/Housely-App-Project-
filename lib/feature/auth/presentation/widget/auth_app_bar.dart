import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () => context.go('/permissionLocation'),
        icon: const Icon(Icons.arrow_back_outlined, size: 27),
      ),
    );
  }
}
