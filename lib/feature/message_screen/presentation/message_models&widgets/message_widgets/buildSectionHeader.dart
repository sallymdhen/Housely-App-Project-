import 'package:flutter/material.dart';

import '../message_classes/SectionLabel.dart';

Widget buildSectionHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Align(
      alignment: Alignment.centerLeft,
      child: SectionLabel(text: 'All Message'),
    ),
  );
}
