import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/feature/details_screen/data/review_model.dart';
import 'package:flutter_application_team2/feature/details_screen/data/view_info.dart';
import 'package:flutter_application_team2/feature/review/widgets/gallery_bottom_sheet.dart';
import 'package:flutter_application_team2/feature/review/widgets/review_hotel_card.dart';
import 'package:flutter_application_team2/feature/review/widgets/review_text_box.dart';
import 'package:flutter_application_team2/feature/review/widgets/upload_box.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final TextEditingController reviewController = TextEditingController();

  String? selectedImage;
  void functionSubmitReview() {
    final reviewText = reviewController.text.trim();

    // لا توجد صورة ولا نص
    if (selectedImage == null && reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please add a photo and write your review"),
        ),
      );
      return;
    }

    // لا توجد صورة
    if (selectedImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please add a photo")));
      return;
    }

    // لا يوجد نص
    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please write your review")));
      return;
    }

    // إضافة المراجعة إلى القائمة
    reviews.add(
      ReviewModel(
        image: selectedImage!,
        name: "You",
        review: reviewText,
        rating: 5,
      ),
    );

    // الانتقال إلى Home بعد نجاح الإضافة
    context.go('/home');
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        title: Text(
          "Write a review",
          style: AppTextStyle.authTitle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 24),

              const ReviewHotelCard(),

              Divider(
                color: AppColor.greyColor.withValues(alpha: 0.25),
                thickness: 1,
                height: 1,
              ),

              const SizedBox(height: 18),

              Text(
                "Add Photo or Video",
                style: AppTextStyle.authTitle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              UploadBox(
                hasImage: selectedImage != null,

                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,

                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),

                    builder: (_) {
                      return GalleryBottomSheet(
                        onImageSelected: (image) {
                          setState(() {
                            selectedImage = image;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Image uploaded successfully"),
                            ),
                          );
                        },
                      );
                    },
                  );
                },

                child: Center(
                  child: selectedImage == null
                      ? Image.asset(
                          "assets/icons/Frame 150.png",
                          width: 114,
                          height: 86,
                        )
                      : selectedImage!.startsWith("assets/")
                      ? Image.asset(
                          selectedImage!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        )
                      : Image.file(
                          File(selectedImage!),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                ),
              ),

              const SizedBox(height: 32),

              Text(
                "Write your review",
                style: AppTextStyle.authTitle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              UploadBox(
                onTap: () {},

                child: ReviewTextBox(controller: reviewController),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "350 characters remaining",
                  style: TextStyle(fontSize: 12, color: AppColor.greyColor),
                ),
              ),

              const SizedBox(height: 70),

              BottomButton(
                title: "Submit Review",
                onPressed: functionSubmitReview,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
