import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
//import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/widget/near_by_card.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_data.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final popularList = EstateData.estates.skip(2).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Popular",
          style: AppTextStyle.locationName.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: popularList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              NearByCard(estate: popularList[index], showFavorite: true),
              const SizedBox(height: 12),
              Container(
                height: 1,
                width: double.infinity,
                color: AppColor.lightgrey,
              ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }
}




















/* final popularList = estates.skip(2).toList();
ListView.builder(
  itemCount: popularList.length,
  itemBuilder: (context, index) {
    return NearByCard(
      estate: popularList[index],
      showFavorite: true,
    );
  },
),*/