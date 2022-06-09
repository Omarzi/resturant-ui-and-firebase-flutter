import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocation extends StatelessWidget {
    final double x, y;
  final String name;
  const GetLocation({ Key? key, required this.x, required this.y, required this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          onMapCreated: (value) {},
          initialCameraPosition:
              CameraPosition(target: LatLng(x, y), zoom: 5.0),
          markers: {
            Marker(
                markerId: MarkerId("1"),
                position: LatLng(x, y),
                infoWindow: InfoWindow(
                  title: 'Resturant',
                  snippet: 'Resturant',
                )
            ),
          }
        ),
    );
  }
}