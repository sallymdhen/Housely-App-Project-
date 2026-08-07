import 'package:flutter/material.dart';

import '../../../data/model/filter_model.dart';
import 'filter_bottom_sheet.dart';

mixin FilterBottomSheetLogic on State<FilterBottomSheet> {
  late FilterModel filter;

  @override
  void initState() {
    super.initState();
    filter = widget.initialFilter!;
  }

  void togglePurpose(PropertyPurpose purpose, bool value) {
    setState(() {
      final next = {...filter.purposes};
      value ? next.add(purpose) : next.remove(purpose);
      filter = filter.copyWith(purposes: next);
    });
  }

  void toggleType(PropertyType type, bool value) {
    setState(() {
      final next = {...filter.types};
      value ? next.add(type) : next.remove(type);
      filter = filter.copyWith(types: next);
    });
  }

  void toggleFacility(String id) {
    setState(() {
      final next = {...filter.facilityIds};
      next.contains(id) ? next.remove(id) : next.add(id);
      filter = filter.copyWith(facilityIds: next);
    });
  }

  void reset() {
    setState(() => filter = FilterModel.empty());
  }

  void apply() {
    Navigator.of(context).pop(filter);
  }
}
