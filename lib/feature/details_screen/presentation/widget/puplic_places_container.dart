import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class PuplicPlacesContainer extends StatelessWidget {
  const PuplicPlacesContainer({super.key, required this.icone, required this.namePlace});
  final String icone;
  final String namePlace;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff8B5CF6).withOpacity(0.12),
      borderRadius: BorderRadius.circular(8),
        ),
          constraints: const BoxConstraints(
          minWidth: 0,
          maxWidth: double.infinity,
        ),
        child:
       Padding(
         padding: const EdgeInsets.symmetric(horizontal:2 ,vertical: 5),
         child: Row(mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset(icone,width: 36,height: 36,),
          SizedBox(width: 1,),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Text(namePlace,style: TextStyle(color: AppColor.blackColor),),
          ),
          
                     
         ],),

       ),);

  }
}