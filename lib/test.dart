import 'dart:async';

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MyApp1 extends StatefulWidget {
//   const MyApp1({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp1> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp1> {
//   List<StepperData> stepperData = [
//     StepperData(
//         title: StepperText(
//           "Order Placed",
//           textStyle: const TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//         subtitle: StepperText("Your order has been placed"),
//         iconWidget: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: const BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//         )),
//     StepperData(
//         title: StepperText("Preparing"),
//         subtitle: StepperText("Your order is being prepared"),
//         iconWidget: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: const BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: const Icon(Icons.looks_two, color: Colors.white),
//         )),
//
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 20),
//               child: AnotherStepper(
//                 stepperList: stepperData,
//                 stepperDirection: Axis.horizontal,
//                 iconWidth: 40,
//                 iconHeight: 40,
//                 activeBarColor: Colors.green,
//                 inActiveBarColor: Colors.grey,
//                 inverted: true,
//                 verticalGap: 30,
//                 activeIndex: 1,
//                 barThickness: 8,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }}
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target:LatLng(37.42796133580664, -122.085749655962), ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}