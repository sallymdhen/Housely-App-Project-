import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  GoogleMapController? mapController;

  bool isLoading = true;

  LatLng? currentLocation;

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        setState(() {
          isLoading = false;
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          isLoading = false;
        });
        return;
      }

      final Position position = await Geolocator.getCurrentPosition();

      final LatLng userLocation = LatLng(position.latitude, position.longitude);

      setState(() {
        currentLocation = userLocation;
        isLoading = false;
        markers = createMarkers(userLocation);
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Set<Marker> createMarkers(LatLng userLocation) {
    return {
      // موقع المستخدم
      Marker(
        markerId: const MarkerId('current_user'),
        position: userLocation,
        infoWindow: const InfoWindow(title: 'Your location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),

      // فندق
      Marker(
        markerId: const MarkerId('hotel_1'),
        position: LatLng(
          userLocation.latitude + 0.003,
          userLocation.longitude + 0.002,
        ),
        infoWindow: const InfoWindow(title: 'Tropis Hotel', snippet: 'Hotel'),
      ),

      // مطعم
      Marker(
        markerId: const MarkerId('restaurant_1'),
        position: LatLng(
          userLocation.latitude - 0.002,
          userLocation.longitude + 0.003,
        ),
        infoWindow: const InfoWindow(
          title: 'Bella Restaurant',
          snippet: 'Restaurant',
        ),
      ),

      // مقهى
      Marker(
        markerId: const MarkerId('cafe_1'),
        position: LatLng(
          userLocation.latitude + 0.001,
          userLocation.longitude - 0.004,
        ),
        infoWindow: const InfoWindow(title: 'Coffee House', snippet: 'Cafe'),
      ),

      // سوبرماركت
      Marker(
        markerId: const MarkerId('market_1'),
        position: LatLng(
          userLocation.latitude - 0.004,
          userLocation.longitude - 0.002,
        ),
        infoWindow: const InfoWindow(
          title: 'Daily Market',
          snippet: 'Supermarket',
        ),
      ),

      // فندق ثاني
      Marker(
        markerId: const MarkerId('hotel_2'),
        position: LatLng(
          userLocation.latitude + 0.005,
          userLocation.longitude - 0.003,
        ),
        infoWindow: const InfoWindow(
          title: 'Grand Villa Hotel',
          snippet: 'Hotel',
        ),
      ),
    };
  }

  void moveToCurrentLocation() {
    if (currentLocation == null || mapController == null) {
      return;
    }

    mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation!, zoom: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : currentLocation == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Unable to get your location'),
                  SizedBox(height: 12.h),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });

                      getCurrentLocation();
                    },
                    child: const Text('Try again'),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentLocation!,
                    zoom: 15,
                  ),

                  onMapCreated: (controller) {
                    mapController = controller;
                  },

                  markers: markers,

                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,

                  zoomControlsEnabled: false,

                  mapToolbarEnabled: false,

                  compassEnabled: false,
                ),

                // عنوان الصفحة
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 15.h,
                    ),
                    child: Container(
                      height: 48.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 12,
                            spreadRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.explore_outlined,
                            color: AppColor.primaryColor,
                            size: 22.sp,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // زر العودة إلى موقعي
                Positioned(
                  right: 20.w,
                  bottom: 30.h,
                  child: GestureDetector(
                    onTap: moveToCurrentLocation,
                    child: Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.my_location,
                        color: AppColor.primaryColor,
                        size: 23.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}
