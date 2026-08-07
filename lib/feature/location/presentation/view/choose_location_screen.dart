import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/auth_app_bar.dart';
import 'package:flutter_application_team2/feature/location/data/location_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';


import '../../../../core/widgets/bottom_button.dart';
import '../widgets/location_card.dart';
import '../widgets/search_location_field.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({super.key});

  @override
  State<ChooseLocationScreen> createState() =>
      _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  final TextEditingController searchController = TextEditingController();

  GoogleMapController? mapController;

  bool isLoading = true;

  LatLng currentLocation = const LatLng(
    35.525,
    35.786,
  );
  LatLng? selectedLocation;
  BitmapDescriptor? customMarker;

  String address = "Jl.Jend.Sudirman, Gowongan, Kec. Jetis, Kota Yogyakarta";

  @override
  void initState() {
    super.initState();
      loadMarker();
    getCurrentLocation();
  }
  Future<void> loadMarker() async {
  customMarker = await BitmapDescriptor.asset(
    const ImageConfiguration(
      size: Size(64, 64),
    ),
    "assets/icons/location_pin.png",
  );

  setState(() {});
}

  Future<void> getCurrentLocation() async {
   

    currentLocation = const LatLng(
      35.525,
      35.786,
    );

    setState(() {
      isLoading = false;
    });

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentLocation,
            zoom: 16,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentLocation,
                    zoom: 16,
                  ),
                  onTap: (LatLng location) async {
  selectedLocation = location;

  List<Placemark> placemarks = await placemarkFromCoordinates(
    location.latitude,
    location.longitude,
  );

  if (placemarks.isNotEmpty) {
    final place = placemarks.first;

    setState(() {
      address = place.name ?? place.locality ?? place.country ?? "";
      selectedLocation = location;
    });
  }
},

                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,

                  onMapCreated: (controller) {
                    mapController = controller;
                  },

                  markers: {
                    Marker(
                      markerId:
                          const MarkerId("current_location"),
                     position: selectedLocation ?? currentLocation,
                    // icon: customMarker ?? BitmapDescriptor.defaultMarker,
                    ),
                  },
                ),

                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 18.h,
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            AuthAppBar(),
                          ],
                        ),
                    
                        SizedBox(height: 18.h),
                    
                        SearchLocationField(
                          controller: searchController,
                        ),
                    
                        const Spacer(),
                    
                        LocationCard(
                          address: address,
                        ),
                    
                        SizedBox(height: 18.h),
                    
                        BottomButton(
                          title: "Choose location",
                          onPressed: () {
                            LocationData.selectedAddress = address;
                            context.go('/home');
                          
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

/*port 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/auth_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/widgets/bottom_button.dart';
import '../widgets/location_card.dart';
import '../widgets/search_location_field.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({super.key});

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  final TextEditingController searchController = TextEditingController();

  GoogleMapController? mapController;

  bool isLoading = true;

  LatLng currentLocation = const LatLng(35.525, 35.786);

  String address = "Your current location";

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLocation = LatLng(position.latitude, position.longitude);

    setState(() {
      isLoading = false;
    });

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation, zoom: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentLocation,
                    zoom: 16,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId("current_location"),
                      position: currentLocation,
                    ),
                  },
                ),

                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 18.h,
                    ),
                    child: Column(
                      children: [
                        Row(children: [const AuthAppBar()]),

                        SizedBox(height: 18.h),

                        SearchLocationField(controller: searchController),

                        const Spacer(),

                        LocationCard(address: address),

                        SizedBox(height: 18.h),

                        BottomButton(
                          title: "Choose location",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
*/
