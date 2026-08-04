// lib/feature/chat_screen/presentation/widgets/property_card_bubble.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class PropertyCardBubble extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;

  const PropertyCardBubble({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  State<PropertyCardBubble> createState() => _PropertyCardBubbleState();
}

class _PropertyCardBubbleState extends State<PropertyCardBubble> {
  bool isTrue = true;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: 164,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColor.whiteAvatar, AppColor.blackAvatar],
                ),
              ),
            ),

            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '\$${widget.price}/month',
                  style: TextStyle(
                    color: AppColor.primaryColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColor.whiteColor,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.location,
                            style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      isTrue = !isTrue;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.whiteColor,
                      radius: 16,
                      child: Image.asset(
                        isTrue
                            ? "assets/image/Heart.png"
                            : "assets/icons/Heart.png",
                        width: 20,
                        height: 20,

                        color: AppColor.redColor,
                      ),
                    ),
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
