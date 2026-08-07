import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SuccesPaySheet extends StatelessWidget {
  const SuccesPaySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 505.h,
      // height: MediaQuery.of(context).size.height * 0.65,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center
        , //mainAxisSize: MainAxisSize.min,
          children: [
             Container(
              
                width: 42,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColor.lightgrey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: 50),
              Image.asset('assets/image/logo_payments.png',width:208 ,height: 208,),
              SizedBox(height: 46,),
              Text('Yey, your booking success',style: AppTextStyle.welcomeBackTextStyle,),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text('you have successfully booked a property, enjoy your property',style: AppTextStyle.authSubTitle,textAlign: TextAlign.center,
),
              ),
              SizedBox(height: 40,),
              PrimaryBottom(name: 'Explore more', onPressed: (){context.go('/home');}, width: double.infinity)
            
        
        
        
          ],
        ),
      ),
    );
  }
}