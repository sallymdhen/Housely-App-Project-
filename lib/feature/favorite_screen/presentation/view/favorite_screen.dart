import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/favorite_screen/data/favorite_data.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/widget/near_by_card.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("favorite", style: AppTextStyle.locationName..copyWith(fontWeight: FontWeight.w800)),
        leading: Icon(Icons.arrow_back),
      ),

      body: FavoriteData.favorite.isEmpty
          ? const Center(
              child: Text(
                "No favorite places added yet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.builder(
                itemCount: FavoriteData.favorite.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      NearByCard(
                        estate: FavoriteData.favorite[index],
                        showFavorite: true,
                        onFavoriteChanged: () {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 12),
                      Container(height: 1, color: AppColor.lightgrey),
                      const SizedBox(height: 12),
                    ],
                  );
                },
              ),
          ),
    );
  }
}
