import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';

class MessageTileDivider extends StatelessWidget {
  MessageTileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColor.dividerColor,
      indent: 56,
    );
  }
}
