import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';

class RoutingContainer extends StatelessWidget {
  final double price;
  final double route;
  final double width;
  final double height;

  const RoutingContainer({
    super.key,
    required this.price,
    required this.route,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$$price/month",
          style: AppTextStyle.NearbyPrice.copyWith(fontWeight: FontWeight.w800),
        ),

        const Spacer(),

        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColor.warningWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 13,
                  color: Colors.amber,
                ),
                Text(
                  route.toString(),
                  style: AppTextStyle.NearbyRouting.copyWith(fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}