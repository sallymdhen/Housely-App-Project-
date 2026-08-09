import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/favorite_screen/data/favorite_data.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:go_router/go_router.dart';

class CardEstate extends StatefulWidget {
  CardEstate({super.key, required this.estate});
  final EstateModel estate;
  //final void Function()? onPressed;

  @override
  State<CardEstate> createState() => _CardEstateState();
}

class _CardEstateState extends State<CardEstate> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite = FavoriteData.favorite.contains(widget.estate);
    return InkWell(
      onTap: () {
        context.push('/details', extra: widget.estate);
      },
      child: Container(
        child: Stack(
          children: [
            Image.asset(widget.estate.image ?? '', height: 164, width: 224),
            Positioned(
              right: 16,
              top: 16,
              child: Container(
                height: 28,
                width: 83,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${widget.estate.price}',
                            style: AppTextStyle.priceEstate,
                          ),
                          TextSpan(
                            text: '/month',
                            style: TextStyle(
                              fontFamily: AppFonts.inter,
                              color: AppColor.greyColor,
                              fontSize: 10,
                              fontWeight: FontWeight(400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 46,
              child: Text(
                widget.estate.name ?? '',
                style: AppTextStyle.nameEstate,
              ),
            ),
            Positioned(
              left: 16,
              bottom: 24,
              child: Row(
                children: [
                  Icon(Icons.place, color: AppColor.lightgrey, size: 16),
                  SizedBox(width: 1),
                  Text(
                    widget.estate.location ?? '',
                    style: AppTextStyle.location.copyWith(color: AppColor.lightgrey),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 31,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      if (FavoriteData.favorite.contains(widget.estate)) {
                        FavoriteData.favorite.remove(widget.estate);
                      } else {
                        FavoriteData.favorite.add(widget.estate);
                      }
                    });
                  },

                 icon: isFavourite
    ? Image.asset('assets/icons/fav_estate.png',height:16 ,width:16 ,)
    :
    Image.asset('assets/icons/UnFav_estete.png',height:16 ,width:16 ,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
