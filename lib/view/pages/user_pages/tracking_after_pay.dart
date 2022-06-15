import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(24.774265, 46.738586),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  // Marker _userPosition = const Marker(
  //   markerId: MarkerId('user'),
  // );
  // Marker _captinPostion = const Marker(
  //   markerId: MarkerId('captain'),
  // );
  // // Directions _info;
  // late Position currentPosition;
  // dynamic lat;
  // dynamic long;

  // @override
  // void initState() {
  //   super.initState();
  //   getGPSPermission();
  //   getLatAndLong();
  // }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CircleAvatar(
                backgroundColor: colorLightGrey2,
                maxRadius: 30.0,
                child: SizedBox(
                    width: 35,
                    height: 35,
                    child:
                        SvgPicture.asset('assets/img/clients_help_icon.svg')),
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            '${AppLocalization.of(context)?.getTranslatedValue('orderTracking')}',
            style: blackText18,
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                height: 30,
                width: 50,
                child: SvgPicture.asset('assets/img/arrow_back.svg'),
              )),
        ),
        body: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Colors.white,
              ),
            ),
            child: GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              // markers: {_userPosition, _captinPostion},
            )),
      ),
    );
  }

  // Future getPermissions() async {
  //   bool services;
  //   LocationPermission per;
  //   services = await Geolocator.isLocationServiceEnabled();
  //   if (services == false) {
  //     //add dialog
  //     print(services);
  //   }
  //   per = await Geolocator.checkPermission();
  //   if (per == LocationPermission.denied) {
  //     per = await Geolocator.requestPermission();
  //   }
  //   return per;
  // }

  // void getGPSPermission() {
  //   Permission.locationWhenInUse
  //       .request()
  //       .then((value) => {if (value.isGranted) {}});
  // }

  // Future<void> getLatAndLong() async {
  //   currentPosition =
  //       await Geolocator.getCurrentPosition().then((value) => value);
  //   lat = currentPosition.latitude;
  //   long = currentPosition.longitude;
  //   setState(() {
  //     print(lat);
  //   });
  //   _addMarker(LatLng(currentPosition.latitude, currentPosition.longitude));
  // }

  // void _addMarker(LatLng position) {
  //   if (_userPosition == null ||
  //       (_userPosition != null && _userPosition != null)) {
  //     // Origin is not set OR Origin/Destination are both set
  //     // Set origin
  //     setState(() {
  //       _userPosition = Marker(
  //         markerId: const MarkerId('user'),
  //         infoWindow: const InfoWindow(title: 'user'),
  //         icon:
  //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: position,
  //       );
  //       // Reset destination
  //       // _captinPostion = null;

  //       // Reset info
  //       // _info = null;
  //     });
  //   } else {
  //     // Origin is already set
  //     // Set destination
  //     setState(() {
  //       _captinPostion = Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: position,
  //       );
  //     });

  //     // // Get directions
  //     // final directions = await DirectionsRepository()
  //     //     .getDirections(origin: _origin.position, destination: pos);
  //     // setState(() => _info = directions);
  //   }
  // }
}
