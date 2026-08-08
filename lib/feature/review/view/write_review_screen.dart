import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/feature/review/widgets/gallery_bottom_sheet.dart';
import 'package:flutter_application_team2/feature/review/widgets/review_hotel_card.dart';
import 'package:flutter_application_team2/feature/review/widgets/review_text_box.dart';
import 'package:flutter_application_team2/feature/review/widgets/upload_box.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final TextEditingController reviewController = TextEditingController();
  String? selectedImage;

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

              const SizedBox(height: 34),

              Text(
                "Add Photo or Video",

                style: AppTextStyle.authTitle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              UploadBox(
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
                          'assets/icons/Frame 150.png',
                          width: 90,
                          height: 86,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),

                          child: Image.asset(
                            selectedImage!,

                            width: double.infinity,

                            height: double.infinity,

                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 32),

              Text(
                "Write your review",

                style: AppTextStyle.authTitle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              UploadBox(
                onTap: () {},

                child: ReviewTextBox(controller: reviewController),
              ),

              const SizedBox(height: 36),

              BottomButton(title: "Submit Review", onPressed: () {}),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
