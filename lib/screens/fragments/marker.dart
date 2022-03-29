import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerPage extends StatefulWidget {
  const MarkerPage({Key? key}) : super(key: key);

  @override
  State<MarkerPage> createState() => _MarkerState();
}

class _MarkerState extends State<MarkerPage> {
  GoogleMapController? controller;
  LatLng? _markerPos;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;
  LatLng? markerPosition;

  void onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

// , 
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
      onTap: (LatLng pos) {
        const String markerIdVal = 'marker_id_1';
        _markerIdCounter++;
        const MarkerId markerId = MarkerId(markerIdVal);

        final Marker marker = Marker(
          markerId: markerId,
          position: LatLng(
            pos.latitude,
            pos.longitude,
          ),
        );

        print(pos);

        setState(() {
          _markerPos = pos;
          markers[markerId] = marker;
        });
      },
    ));
  }
}
