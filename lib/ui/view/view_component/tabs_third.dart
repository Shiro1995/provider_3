import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ThirdTab extends StatefulWidget {
  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  Completer<GoogleMapController> _controller = Completer();
  static final daNangLocation = LatLng(16.047079, 108.206230);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.047079, 108.206230),
    zoom: 10,
  );

  static final CameraPosition _kLake = CameraPosition(
    target: LatLng(16.047079, 108.206230),
    tilt: 59.440717697143555,
    zoom: 15,
  );
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId(daNangLocation.toString()),
      position: daNangLocation,
      infoWindow: InfoWindow(title: 'Hiệu thuốc'),
      icon: BitmapDescriptor.defaultMarker,
    )
  };
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () => _goToTheLake());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Pharmacy map')),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _markers,
          ),
          // Padding(
          //   padding: EdgeInsets.all(10),
          //   child: Row(
          //     children: <Widget>[
          //       Expanded(
          //         child: Container(
          //           color: Colors.blue,
          //           child: IconButton(
          //             icon: Icon(Icons.arrow_back),
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton.extended(
          onPressed: () => _goToTheLake,
          label: Text('Find the pharmacy'),
          icon: Icon(Icons.location_city),
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
