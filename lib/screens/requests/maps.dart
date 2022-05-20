import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  final Map<String, dynamic> bookingData;

  const LocationPage({Key? key, required this.bookingData}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    data = widget.bookingData;
  }

  GoogleMapController? controller;
  LatLng? _markerPos;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;
  LatLng? markerPosition;

  void onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(-1.286389, 36.817223),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        onMapCreated: onMapCreated,
        markers: Set<Marker>.of(markers.values),
        
        // onTap: (LatLng pos) {
        //   const String markerIdVal = 'marker_id_1';
        //   _markerIdCounter++;
        //   const MarkerId markerId = MarkerId(markerIdVal);

        //   final Marker marker = Marker(
        //     markerId: markerId,


        //     position: LatLng(
        //       pos.latitude,
        //       pos.longitude,
        //     ),
        //   );

        //   print(pos);

        //   setState(() {
        //     _markerPos = pos;
        //     markers[markerId] = marker;
        //   });
        // },
      ),
    );
  }
}
