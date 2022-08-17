import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final Set<Marker> markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: const CameraPosition(
          // lat long sao paulo
          target: LatLng(-23.533773, -46.625290),
          zoom: 11.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _add(-23.678712500000003, -46.65674, "8000", "METRÔ JABAQUARA");
        },
        markers: markers);
  }

  void _add(double px, double py, String title, String snippet) {
    String markerIdVal = (Random().nextInt(10000000)).toString();
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(px, py),
        infoWindow: InfoWindow(title: title, snippet: snippet),
        onTap: () => null);

    setState(() {
      markers.add(marker);
    });
  }
}
