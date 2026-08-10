/*import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/widget/near_by_card.dart';

class FilterResultScreen extends StatelessWidget {
  final List<EstateModel> estates;

  const FilterResultScreen({
    super.key,
    required this.estates,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Results'),
        centerTitle: false,
      ),
      body: estates.isEmpty
          ? Center(
              child: Text(
                'No properties found',
                style: AppTextStyle.priceEstate,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              itemCount: estates.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 18),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  child: NearByCard(
                    estate: estates[index],
                    showFavorite: true,
                  ),
                );
              },
            ),
    );
  }
}*/import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';

class FilterResultScreen extends StatelessWidget {
  final List<EstateModel> estates;

  const FilterResultScreen({
    super.key,
    required this.estates,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Filter Results',
         style:AppTextStyle.locationName.copyWith(fontWeight: FontWeight.w800,fontSize: 24),
        ),
      ),
      body: estates.isEmpty
          ? _emptyResults()
          
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(
                16.w,
                12.h,
                16.w,
                24.h,
              ),
              itemCount: estates.length,
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Divider(
                    height: 1.h,
                    thickness: 0.8,
                    color: Colors.grey.shade200,
                  ),
                );
              },
              itemBuilder: (context, index) {
                return _EstateResultCard(
                  estate: estates[index],
                );
              },
            ),
    );
  }

  Widget _emptyResults() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_work_outlined,
              size: 70.sp,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 18.h),
            Text(
              'No properties found',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Try changing your filter options',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EstateResultCard extends StatelessWidget {
  final EstateModel estate;

  const _EstateResultCard({
    required this.estate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14.r,
            offset: Offset(0, 5.h),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16.w,
              14.h,
              16.w,
              16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        estate.name ?? 'Unnamed Property',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    _buildType(),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 19.sp,
                      color: AppColor.primaryColor,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        estate.location ?? 'Location unavailable',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '\$${estate.price?.toStringAsFixed(0) ?? '0'}',
                            style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' / night',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 20.sp,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 205.h,
            child: estate.image != null && estate.image!.isNotEmpty
                ? Image.asset(
                    estate.image!,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey.shade200,
                    child: Icon(
                      Icons.image_outlined,
                      size: 55.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),
          ),
        ),
        Positioned(
          top: 12.h,
          right: 12.w,
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.92),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border_rounded,
              size: 22.sp,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildType() {
    String typeName = 'Property';

    if (estate.type != null) {
      typeName = estate.type.toString().split('.').last;
      typeName =
          typeName[0].toUpperCase() + typeName.substring(1);
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.10),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        typeName,
        style: TextStyle(
          fontSize: 11.5.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}