import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/favorite_screen/data/favorite_data.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/widget/routing_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class NearByCard extends StatefulWidget {
  final EstateModel estate;
  final VoidCallback? onFavoriteChanged;
  bool showFavorite;

  NearByCard({
    super.key,
    required this.estate,
    this.showFavorite = false,
    this.onFavoriteChanged,
  });

  @override
  State<NearByCard> createState() => _NearByCardState();
}

class _NearByCardState extends State<NearByCard> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite = FavoriteData.favorite.contains(widget.estate);
    return InkWell(
      onTap: () {
        context.push('/details', extra: widget.estate);
      },

      child: Container(
        width: double.infinity,
        //height: 74,
        //padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.estate.image ?? '',
                width: 80,
                height: 62,
                fit: BoxFit.cover,
                
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.estate.name ?? '',
                        style: AppTextStyle.NearbyName.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(child: SizedBox()),
                      if (widget.showFavorite)
                        InkWell(
                          // padding: EdgeInsets.zero,
                          onTap: () {
                            setState(() {
                              if (FavoriteData.favorite.contains(
                                widget.estate,
                              )) {
                                FavoriteData.favorite.remove(widget.estate);
                              } else {
                                FavoriteData.favorite.add(widget.estate);
                              }
                            });
                            widget.onFavoriteChanged?.call();
                          },

                          child:isFavourite
    ? Image.asset('assets/icons/fav_estate.png',height:24 ,width:24 ,)
    :
    Image.asset('assets/icons/UnFav_estete.png',height:24 ,width:24 ,)
                        ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset('assets/icons/Location.png', width: 16),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.estate.location ?? '',
                          style: AppTextStyle.NearbyLoc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  ///////////////////////////////////////////////////////////////////////
                  RoutingContainer(
                    price: widget.estate.price ?? 0,
                    route: widget.estate.route ?? 0,
                    width: 43,
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
