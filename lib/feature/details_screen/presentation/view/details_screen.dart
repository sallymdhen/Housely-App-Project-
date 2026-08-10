import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';
import 'package:flutter_application_team2/feature/details_screen/data/estate_feature_data.dart';
import 'package:flutter_application_team2/feature/details_screen/data/view_info.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/details_feature_of_estate.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/discription_widget.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/puplic_places_container.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/review_card.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/shar_and_shat_widget.dart';
//import 'package:flutter_application_team2/feature/details_screen/presentation/widget/share_bottom_sheet.dart';
import 'package:flutter_application_team2/feature/favorite_screen/data/favorite_data.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatefulWidget {
  final EstateModel estate;

  const DetailsScreen({super.key, required this.estate});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<String> constantPhotoOfEstate = [
    'assets/image/one_estate_in_detail.png',
    'assets/image/tow_estate_in_detail.png',
    'assets/image/three_estate_in_detail.png',
    'assets/image/four_estate_in_detail.png',
  ];
  int selectedIndex = 0;
  //String? selectedImage;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    //selectedImage = widget.estate.image;
  }

  @override
  Widget build(BuildContext context) {
    bool isFavourite = FavoriteData.favorite.contains(widget.estate);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop('/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Details',
          style: AppTextStyle.locationName.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          SizedBox(width: 27),
          Image.asset('assets/icons/share.png', height: 24, width: 24),
          SizedBox(width: 16),
          IconButton(
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
                ? Image.asset(
                    'assets/icons/fav_estate.png',
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    'assets/icons/Heart_grey.png',
                    height: 24,
                    width: 24,
                  ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 232.h,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount:
                                constantPhotoOfEstate.length +
                                1, // +1 لصورة المودل
                            onPageChanged: (index) {
                              setState(() {
                                if (index == 0) {
                                  selectedIndex = -1; // لا تضيء أي نقطة
                                } else {
                                  selectedIndex = index - 1;
                                }
                              });
                            },
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  index == 0
                                      ? widget.estate.image!
                                      : constantPhotoOfEstate[index - 1],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),

                        Positioned(
                          bottom: 24.h,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              constantPhotoOfEstate.length,
                              (index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  width: 8.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedIndex == index
                                        ? AppColor.primaryColor
                                        : AppColor.whiteColor,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 73.h,
                      child: ListView.builder(
                        itemCount: constantPhotoOfEstate.length,

                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                height: 72.h,
                                width: 76.w,
                                child: Image.asset(
                                  constantPhotoOfEstate[index],
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 8.w),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          widget.estate.name!,
                          style: AppTextStyle.locationName.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$${widget.estate.price}',
                                style: AppTextStyle.priceEstate.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: '\\month',
                                style: AppTextStyle.searchProperty.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/Location.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          widget.estate.location ?? '',
                          style: AppTextStyle.searchProperty,
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    Text(
                      'Property Details',
                      style: AppTextStyle.locationName.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: EstateFeatureData.features.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 40,
                          ),
                      itemBuilder: (context, index) {
                        final feature = EstateFeatureData.features[index];

                        return DetailsFeatureOfEstate(
                          title: feature.title,
                          valueOfTitle: feature.value,
                          member: feature.icon != null
                              ? Image.asset(
                                  feature.icon!,
                                  width: 16,
                                  height: 16,
                                )
                              : null,
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    Text('Description', style: AppTextStyle.locationName),
                    SizedBox(height: 16),
                    DescriptionWidget(
                      description:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s, when an unknown printer took when an unknown printer took a type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Agent',
                      style: AppTextStyle.locationName.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          'assets/image/agent_photo.png',
                          width: 52,
                          height: 52,
                        ),
                        SizedBox(width: 16),
                        Column(
                          children: [
                            Text(
                              'Esther Howard',
                              style: AppTextStyle.NearbyName,
                            ),
                            Text(
                              'Real Estate Agent',
                              style: AppTextStyle.searchProperty.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        ActionIcon(
                          img: 'assets/icons/Call.png',
                          onTap: () {
                            context.push('/message');
                          },
                        ),
                        SizedBox(width: 8),
                        ActionIcon(
                          img: 'assets/icons/chat.png',
                          onTap: () {
                            context.push(
                              '/chat',
                              extra: {
                                'userName': 'albert',
                                'userAvatar': 'assets/image/person5.png',
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Location & Public Fasilities',
                      style: AppTextStyle.locationName.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 30,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PuplicPlacesContainer(
                              icone: 'assets/icons/hospital_icon.png',
                              namePlace: 'Hocpital',
                            ),
                            SizedBox(width: 8),
                            PuplicPlacesContainer(
                              icone: 'assets/icons/gas-pump_icon.png',
                              namePlace: 'Gas stations',
                            ),
                            SizedBox(width: 8),
                            PuplicPlacesContainer(
                              icone: 'assets/icons/Bag_icon.png',
                              namePlace: 'Mall',
                            ),
                            SizedBox(width: 8),
                            PuplicPlacesContainer(
                              icone: 'assets/icons/mosque_icon.png',
                              namePlace: 'Mosque',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Image.asset('assets/image/map_location.png'),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'Reviews 152',
                          style: AppTextStyle.locationName.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text('See all', style: AppTextStyle.Nearby),
                      ],
                    ),

                    SizedBox(height: 16),
                    SizedBox(
                      height: 104.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        //padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: reviews.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return ReviewCard(review: reviews[index]);
                        },
                      ),
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24.h),
                child: PrimaryBottom(
                  name: 'Rent now',
                  width: double.infinity,
                  onPressed: () {
                    context.push('/reserve', extra: widget.estate);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
