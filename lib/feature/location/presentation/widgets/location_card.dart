import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationCard extends StatelessWidget {
  final String address;

  const LocationCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location Details",
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 18.h),

          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColor.primaryColor.withOpacity(.15),

                child: Icon(Icons.location_on, color: AppColor.primaryColor),
              ),

              SizedBox(width: 15.w),

              Expanded(
                child: Text(
                  address,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
