import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_data.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/widget/card_estate.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/widget/near_by_card.dart';
import 'package:flutter_application_team2/feature/home_screen/presentation/widget/top_location_card.dart';
import 'package:flutter_application_team2/feature/location/data/location_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_team2/feature/favorite_screen/data/favorite_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
   final estates = EstateData.estates;
  List<EstateModel> nearByEstate = [
    EstateModel(
      image: 'assets/image/estate_five.png',
      name: 'maharani villa ',
      price: 380,
      location: 'Benhil , jl.Bendug',
      route: 4.5
    ),
    EstateModel(
      image: 'assets/image/estate_seven.jpg',
      name: 'green valley',
      price: 210,
      location: 'Menteny.jl thamirin',
      route: 4.5
    ),

    EstateModel(
      image: 'assets/image/estate_eight.jpg',
      name: 'Azure beach front',
      price: 310,
      location: 'Ancol,jl.panta india',
      route: 4.5
    ),

    EstateModel(
      image: 'assets/image/estate_nine.jpg',
      name: 'Apartement land',
      price: 520,
      location: 'jl.tentara palajar',
      route: 4.7
    ),
  ];

  List<EstateModel> topLoc=[
    EstateModel(
    image: 'assets/image/yogykart_estate.png' ,
    location: 'yodykarta'),

    EstateModel(
    image: 'assets/image/Bali_estate.png' ,
    location: 'Bali'),
    
    EstateModel(
    image: 'assets/image/malang_estate.png' ,
    location: 'Malang'),

   /*EstateModel(
    image: 'assets/image/estate_five.png' ,
    location: 'Taywan'),*/
     
    
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Location', style: AppTextStyle.location),
                    SizedBox(width: 5),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 17,
                      height: 20,
                      child: Icon(Icons.place, color: AppColor.primaryColor),
                    ),
                    SizedBox(width: 7.5),
                    Text(LocationData.selectedAddress.split(',').first, style: AppTextStyle.locationName),
                    Expanded(child: SizedBox()),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColor.whiteColor,
                      ),
                      child: Stack(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.push('/notification');
                            },
                            icon: Image.asset(
                              'assets/icons/Notification.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor: AppColor.redColor,
                              radius: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColor.whiteColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.push('/message');
                        },
                        icon: Image.asset(
                          'assets/icons/black_chat.-iconpng.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    context.push('/search');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 62,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColor.greyColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Image.asset(
                           'assets/icons/Hide.png',height:25 ,width: 25,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Search property',
                            style: AppTextStyle.searchProperty.copyWith(fontSize: 16),
                          ),
                          Expanded(child: SizedBox()),
                          IconButton(
                            onPressed: () {
                              context.push('/filtter');
                            },
                            icon: Image.asset(
                              'assets/icons/Filter.png',
                              width: 24,
                              height: 24,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                ClipRRect(borderRadius: BorderRadiusGeometry.circular(15),
                  child: Image.asset(
                    'assets/image/Promo.png',
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Text('Recommended', style: AppTextStyle.locationName.copyWith(fontWeight:FontWeight.w700)),
                    Expanded(child: SizedBox()),
                    Text('See all', style: AppTextStyle.Nearby),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 164,
                  child: ListView.builder(
                    itemCount: estates.take(2).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CardEstate(estate:estates.take(2).toList()[index],);
                    },
                  ),
                ),
                SizedBox(height: 24),

                Row(
                  children: [
                    Text('Nearby', style: AppTextStyle.locationName.copyWith(fontWeight:FontWeight.w700)),
                    Expanded(child: SizedBox()),
                    Text('See all', style: AppTextStyle.Nearby),
                  ],
                ),

                SizedBox(height: 16),

                SizedBox(
                 height: 180,
               
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal, 
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      mainAxisSpacing: 22, 
                      //crossAxisSpacing: 11, 
                       mainAxisExtent: 216,
                     // childAspectRatio: 224 / 164, 
                    ),
                    itemCount: nearByEstate.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          NearByCard(estate: nearByEstate[index]),
                          SizedBox(height: 12,),
                          Container(height: 1,color: AppColor.lightgrey,width: double.infinity,)
                        ],
                      );
                    },
                  ),
                ),
                 //SizedBox(height:16 ,) ,
                Row(
                  children: [
                    Text('Top Location', style: AppTextStyle.locationName.copyWith(fontWeight:FontWeight.w700)),
                    Expanded(child: SizedBox()),
                    Text('See all', style: AppTextStyle.Nearby),
                  ],
                ),SizedBox(height: 16,),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    itemCount: topLoc.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          TopLocationCard(topLocation: topLoc[index]),
                           SizedBox(width: 13)
                        ],
                      );
                     
                    },
                  ),
                ),SizedBox(height: 24,),
                Row(
                  children: [
                    Text('Popular For You', style: AppTextStyle.locationName.copyWith(fontWeight:FontWeight.w700)),
                    Expanded(child: SizedBox()),
                    InkWell(onTap: () {
                      context.push('/home/popular');
                    },
                      child: Text('See all', style: AppTextStyle.Nearby)),
                  ],
                ),
                SizedBox(height: 16,),
                
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: estates.skip(2).take(3).toList().length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        NearByCard(estate: estates.skip(2).take(3).toList()[index],showFavorite: true,),
                        SizedBox(height: 12,),
                         Container(height: 1,color: AppColor.lightgrey,width: double.infinity,),
                         SizedBox(height: 12,),
                         
                      ],
                    );
                  },
                ),


                










              ],
            ),
          ),
        ),
      ),
    );
  }
}
