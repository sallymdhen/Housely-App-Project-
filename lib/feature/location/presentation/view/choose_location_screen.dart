import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/auth_app_bar.dart';
import 'package:flutter_application_team2/feature/location/data/location_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/widgets/bottom_button.dart';
import '../widgets/location_card.dart';
import '../widgets/search_location_field.dart';

class ChooseLocationScreen extends StatefulWidget {
  final bool useCurrentLocation;

  const ChooseLocationScreen({super.key, required this.useCurrentLocation});

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  final TextEditingController searchController = TextEditingController();

  GoogleMapController? mapController;

  bool isLoading = true;

  LatLng currentLocation = const LatLng(35.525, 35.786);
  LatLng? selectedLocation;
  BitmapDescriptor? customMarker;

  String address = "Select a location";

  @override
  void initState() {
    super.initState();

    loadMarker();

    if (widget.useCurrentLocation) {
      getCurrentLocation();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadMarker() async {
    customMarker = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(64, 64)),
      "assets/icons/location_pin.png",
    );

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please turn on location services.")),
        );

        setState(() {
          isLoading = false;
        });
      }

      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission is required.")),
        );

        setState(() {
          isLoading = false;
        });
      }

      return;
    }

    final Position position = await Geolocator.getCurrentPosition();

    currentLocation = LatLng(position.latitude, position.longitude);

    selectedLocation = currentLocation;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;

      address =
          place.name ?? place.locality ?? place.country ?? "Current location";
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLocation, zoom: 16),
        ),
      );
    }
  }

  Future<void> selectLocation(LatLng location) async {
    selectedLocation = location;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;

      setState(() {
        address =
            place.name ??
            place.locality ??
            place.country ??
            "Selected location";

        selectedLocation = location;
      });
    }
  }

  void chooseLocation() {
    if (selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a location first.")),
      );

      return;
    }

    LocationData.selectedAddress = address;

    context.go('/home');
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

                  onTap: selectLocation,

                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,

                  onMapCreated: (controller) {
                    mapController = controller;

                    if (widget.useCurrentLocation && selectedLocation != null) {
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(target: selectedLocation!, zoom: 16),
                        ),
                      );
                    }
                  },

                  markers: selectedLocation == null
                      ? {}
                      : {
                          Marker(
                            markerId: const MarkerId("selected_location"),
                            position: selectedLocation!,
                            icon:
                                customMarker ?? BitmapDescriptor.defaultMarker,
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
                        const Row(children: [AuthAppBar()]),

                        SizedBox(height: 18.h),

                        SearchLocationField(controller: searchController),

                        const Spacer(),

                        LocationCard(address: address),

                        SizedBox(height: 18.h),

                        BottomButton(
                          title: "Choose location",
                          onPressed: chooseLocation,
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
