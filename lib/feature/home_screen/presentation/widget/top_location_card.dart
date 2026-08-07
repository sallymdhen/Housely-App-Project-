import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';

class TopLocationCard extends StatefulWidget {
   TopLocationCard({super.key, required this.topLocation});
  final EstateModel topLocation;
  

  @override
  State<TopLocationCard> createState() => _TopLocationCardState();
  
}

class _TopLocationCardState extends State<TopLocationCard> {
  static bool click=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          click=!click;
          
        });
      }


      ,child: Container(
      decoration: BoxDecoration(color: click?AppColor.primaryColor:AppColor.darkWhite,
      borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(color: AppColor.greyColor)),
          constraints: const BoxConstraints(
          minWidth: 0,
          maxWidth: double.infinity,
        ),
        child:
       Padding(
         padding: const EdgeInsets.all(4),
         child: Row(mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset(widget.topLocation.image??'',width: 36,height: 36,),
          SizedBox(width: 6,),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Text(widget.topLocation.location??'',style: TextStyle(color: click?AppColor.whiteColor:AppColor.greyColor,fontSize: 13),),
          ),
          
          
               
         ],),
       ),),
    );
  }
}