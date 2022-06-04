import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MatchingRoutes.dart';
import 'package:flutter_application_1/Widegts/ReuseableWidgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    Position position;
    double latitude;
    double longitude;
    Future getcurrentlocation() async {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    }

    @override
    void initState() {
      super.initState();
      getcurrentlocation();
    }

    final size = MediaQuery.of(context).size;

    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 17.4746,
    );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.satellite,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            SearchingBox(size: size),
          ],
        ),
      ),
    );
  }
}
