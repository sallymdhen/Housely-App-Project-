import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/widget/search_widget/price_range_slider.dart';
import 'package:flutter_application_team2/feature/search_screen/presentation/widget/search_widget/void_FilterBottomSheet.dart';

import '../../../data/model/DragHandle.dart';
import '../../../data/model/FilterActionBar.dart';
import '../../../data/model/facility_model.dart';
import '../../../data/model/filter_model.dart';
import 'facility_card.dart';
import 'filter_checkbox_row.dart';
import 'filter_section.dart';
import 'searchTheme.dart';

Future<FilterModel?> showFilterBottomSheet(
  BuildContext context, {
  required FilterModel initialFilter,
}) {
  return showModalBottomSheet<FilterModel>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (_) => FilterBottomSheet(initialFilter: initialFilter),
  );
}

class FilterBottomSheet extends StatefulWidget {
  final FilterModel? initialFilter;

  const FilterBottomSheet({super.key, required this.initialFilter});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet>
    with FilterBottomSheetLogic {
  static const List<FacilityModel> _allFacilities = [
    FacilityModel(
      id: 'bedroom',
      label: 'Bed room',
      iconPath: "assets/icons/bedroom.png",
    ),
    FacilityModel(
      id: 'bathub',
      label: 'Bathub',
      iconPath: "assets/icons/bathub.png",
    ),
    FacilityModel(id: 'ac', label: 'AC', iconPath: "assets/icons/Ac.png"),
    FacilityModel(id: 'wifi', label: 'WIFI', iconPath: "assets/icons/Wifi.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.sheet),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              DragHandle(),
              const SizedBox(height: 12),
              Text('Filter', style: AppTextStyles.screenTitle),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterSection(
                        title: 'Looking for',
                        child: Column(
                          children: [
                            FilterCheckboxRow(
                              label: 'For Rent',
                              value: filter.purposes.contains(
                                PropertyPurpose.forRent,
                              ),
                              onChanged: (v) =>
                                  togglePurpose(PropertyPurpose.forRent, v),
                            ),
                            FilterCheckboxRow(
                              label: 'For Sale',
                              value: filter.purposes.contains(
                                PropertyPurpose.forSale,
                              ),
                              onChanged: (v) =>
                                  togglePurpose(PropertyPurpose.forSale, v),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      FilterSection(
                        title: 'Property Type',
                        trailing: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Show all',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            FilterCheckboxRow(
                              label: 'Apartement',
                              value: filter.types.contains(
                                PropertyType.apartment,
                              ),
                              onChanged: (v) =>
                                  toggleType(PropertyType.apartment, v),
                            ),
                            FilterCheckboxRow(
                              label: 'Penhouse',
                              value: filter.types.contains(
                                PropertyType.penthouse,
                              ),
                              onChanged: (v) =>
                                  toggleType(PropertyType.penthouse, v),
                            ),
                            FilterCheckboxRow(
                              label: 'Hotel',
                              value: filter.types.contains(PropertyType.hotel),
                              onChanged: (v) =>
                                  toggleType(PropertyType.hotel, v),
                            ),
                            FilterCheckboxRow(
                              label: 'Villa',
                              value: filter.types.contains(PropertyType.villa),
                              onChanged: (v) =>
                                  toggleType(PropertyType.villa, v),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      FilterSection(
                        title: 'Price Range',
                        child: PriceRangeSlider(
                          values: filter.priceRange,
                          onChanged: (values) {
                            setState(() {
                              filter = filter.copyWith(priceRange: values);
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      FilterSection(
                        title: 'Facilities',
                        child: Row(
                          children: _allFacilities
                              .map(
                                (facility) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: FacilityCard(
                                    facility: facility,
                                    selected: filter.facilityIds.contains(
                                      facility.id,
                                    ),
                                    onTap: () => toggleFacility(facility.id),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              FilterActionBar(onReset: reset, onApply: apply),
            ],
          ),
        );
      },
    );
  }
}
