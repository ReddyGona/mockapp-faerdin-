import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mockapp/src/core/utils/constants/app_constants.dart';
import 'dart:ui' as ui;

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({
    super.key,
  });

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  static const googlePlex = LatLng(14.83230949940842, 78.38413242698778);
  static const destinationPlex = LatLng(14.690490932071022, 77.598023934422);

  final locationController = Location();

  LatLng? currentPosition;

  bool isLoading = true;

  Map<PolylineId, Polyline> polylines = {};

  final Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor? customIcon1;
  BitmapDescriptor? customIcon2;
  BitmapDescriptor? customIcon3;
  BitmapDescriptor? customIcon4;
  BitmapDescriptor? customIcon5;
  BitmapDescriptor? customIcon6;
  BitmapDescriptor? customIcon7;

  double zoomLevel = 0;

  @override
  void initState() {
    super.initState();
    initializeMap();
  }

  Future<void> initializeMap() async {
    await Future.wait([loadCustomMarker(), fetchLocationUpdates()]);

    final coordinates = await fetchPolyLinePoints();
    generatePolylinesFromPoints(coordinates);

    // Move the camera position to fit both source and destination locations
    moveCameraToFitBounds();

    setState(() {
      isLoading = false;
    });
  }

  Future<void> loadCustomMarker() async {
    final Uint8List? markerBytes = await getBytesFromCanvas(1, 50, 50);
    final Uint8List? markerBytes1 = await getBytesFromCanvas(2, 50, 50);
    final Uint8List? markerBytes2 = await getBytesFromCanvas(3, 50, 50);
    final Uint8List? markerBytes3 = await getBytesFromCanvas(4, 50, 50);
    final Uint8List? markerBytes4 = await getBytesFromCanvas(5, 50, 50);
    final Uint8List? markerBytes5 = await getBytesFromCanvas(6, 50, 50);
    if (markerBytes != null &&
        markerBytes1 != null &&
        markerBytes2 != null &&
        markerBytes3 != null &&
        markerBytes4 != null &&
        markerBytes5 != null) {
      customIcon1 = BitmapDescriptor.fromBytes(markerBytes);
      customIcon2 = BitmapDescriptor.fromBytes(markerBytes1);
      customIcon3 = BitmapDescriptor.fromBytes(markerBytes2);
      customIcon4 = BitmapDescriptor.fromBytes(markerBytes3);
      customIcon5 = BitmapDescriptor.fromBytes(markerBytes4);
      customIcon6 = BitmapDescriptor.fromBytes(markerBytes5);
    } else {
      // Handle the case where markerBytes is null
      // For example, you can set a default icon or log an error
      // customIcon = BitmapDescriptor.defaultMarker;
      print('Error: markerBytes is null');
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
      setState(() {});
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        currentPosition =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        setState(() {});
      }
    });
  }

  Future<List<LatLng>> fetchPolyLinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(googlePlex.latitude, googlePlex.longitude),
      PointLatLng(destinationPlex.latitude, destinationPlex.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolylinesFromPoints(
      List<LatLng> polyLineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polyLineCoordinates,
      width: 5,
      jointType: JointType.mitered,
    );

    polylines[id] = polyline;
    setState(() {});
  }

  Future<Uint8List?> getBytesFromCanvas(
      int customNum, int width, int height) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.blue;
    final Radius radius = Radius.circular(width / 2);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: customNum.toString(), // your custom number here
      style: const TextStyle(fontSize: 45.0, color: Colors.white),
    );

    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * .5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    if (data == null) {
      return null;
    }
    return data.buffer.asUint8List();
  }

  void moveCameraToFitBounds() {
    if (currentPosition == null) return;

    final LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        min(googlePlex.latitude, destinationPlex.latitude),
        min(googlePlex.longitude, destinationPlex.longitude),
      ),
      northeast: LatLng(
        max(googlePlex.latitude, destinationPlex.latitude),
        max(googlePlex.longitude, destinationPlex.longitude),
      ),
    );

    _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 100.0),
      );
    });
  }

  double _calculateZoomLevel() {
    const double minZoom = 5.0;
    const double maxZoom = 15.0;
    const double minLatDiff = 0.1; // Adjust as needed
    const double minLongDiff = 0.1; // Adjust as needed

    final double latDiff =
        (googlePlex.latitude - destinationPlex.latitude).abs();
    final double longDiff =
        (googlePlex.longitude - destinationPlex.longitude).abs();

    final double zoomLat = log(minLatDiff / latDiff) / log(2);
    final double zoomLong = log(minLongDiff / longDiff) / log(2);

    final double zoom = min(maxZoom, max(minZoom, min(zoomLat, zoomLong)));

    return zoom;
  }

  @override
  void dispose() {
    super.dispose();
    // Reset orientation to portrait mode when the screen is disposed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _controller.future.then((controller) {
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentPosition == null && isLoading == true
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : GoogleMap(
            fortyFiveDegreeImageryEnabled: true,
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            zoomControlsEnabled: false,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: googlePlex,
              zoom: _calculateZoomLevel(),
            ),
            layoutDirection: TextDirection.ltr,
            markers: _createMarkers(),
            polylines: Set<Polyline>.of(polylines.values),
            onMapCreated: (controller) => _controller.complete(controller),
          );
  }

  Set<Marker> _createMarkers() {
    return {
      if (currentPosition != null)
        Marker(
          markerId: const MarkerId('currentPosition'),
          icon: BitmapDescriptor.defaultMarker,
          position: currentPosition!,
        ),
      if (customIcon1 != null)
        Marker(
          markerId: const MarkerId('1'),
          icon: customIcon1!,
          position: googlePlex,
          infoWindow: const InfoWindow(title: 'Jammalamadugu'),
        ),
      if (customIcon2 != null)
        Marker(
          markerId: const MarkerId('2'),
          icon: customIcon2!,
          position: const LatLng(14.689476711216166, 78.39348530495548),
          infoWindow: const InfoWindow(title: 'Muddanur'),
        ),
      if (customIcon3 != null)
        Marker(
          markerId: const MarkerId('3'),
          icon: customIcon3!,
          position: const LatLng(14.775412892183676, 78.19406764593653),
          infoWindow: const InfoWindow(title: 'Kondapur'),
        ),
      if (customIcon4 != null)
        Marker(
          markerId: const MarkerId('4'),
          icon: customIcon4!,
          position: const LatLng(14.909733190132071, 78.00826612906347),
          infoWindow: const InfoWindow(title: 'Tadipatri'),
        ),
      if (customIcon5 != null)
        Marker(
          markerId: const MarkerId('5'),
          icon: customIcon5!,
          position: const LatLng(14.745466997746298, 77.68946233441696),
          infoWindow: const InfoWindow(title: 'SRIT'),
        ),
      if (customIcon6 != null)
        Marker(
          markerId: const MarkerId('6'),
          icon: customIcon6!,
          position: destinationPlex,
          infoWindow: const InfoWindow(title: 'Ananthapur'),
        ),
    };
  }
}
