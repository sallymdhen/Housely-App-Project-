import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:image_picker/image_picker.dart';

class GalleryBottomSheet extends StatelessWidget {
  final Function(String imagePath) onImageSelected;

  const GalleryBottomSheet({super.key, required this.onImageSelected});

  final List<String> images = const [
    "assets/image/Rectangle 33 (8).png",
    "assets/image/Rectangle 33 (7).png",
    "assets/image/Rectangle 33 (6).png",
    "assets/image/Rectangle 33 (5).png",
    "assets/image/Rectangle 33 (3).png",
    "assets/image/Rectangle 33 (4).png",
    "assets/image/Rectangle 33 (9).png",
    "assets/image/Rectangle 33 (1).png",
    "assets/image/Rectangle 33 (2).png",
  ];

  Future<void> pickFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      onImageSelected(image.path);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Gallery",
                style: AppTextStyle.authTitle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 18),

              GestureDetector(
                onTap: () => pickFromGallery(context),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_library_outlined, size: 20),
                      SizedBox(width: 8),
                      Text("Choose from phone gallery"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onImageSelected(images[index]);
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(images[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
