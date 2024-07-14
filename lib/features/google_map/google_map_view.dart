import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/google_map/add_new_address/add_new_address_view.dart';

import 'google_map_cubit.dart';
import 'google_map_state.dart';

class GoogleMapPage extends StatelessWidget {
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

    return BlocProvider(

      create: (BuildContext context) => GoogleMapCubit(),
      child: BlocBuilder<GoogleMapCubit, GoogleMapState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<GoogleMapCubit>(context);
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<GoogleMapCubit>(context);
    return Scaffold(

        body: ListView(
          shrinkWrap: true,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                CustomAuthenticationHeader(),
                SizedBox(
                  height: 10,
                ),
                 Text(
                  "Select Delivery Address".tr(),
                  style: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 13,
                ),
                  SizedBox(
                    width:double.infinity,
                    child: CustomTextField(
                      radius: 5,
                      isNext: true,
                      prefixIcon: Padding(
                        padding:
                        const EdgeInsets.only(left: 19.0, right: 7),
                        child: Icon(Iconic.search),
                      ),
                      hint: 'Search for address'.tr(),
                      hintColor: AppStyle.greyColor,
                      // controller: controller.email,
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),

              ]),
          ),
        ),

            Container(
            height: MediaQuery.of(context).size.height*.74,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(borderRadius:BorderRadius.circular(30) ,
              child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(target:LatLng(37.42796133580664, -122.085749655962), ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
                        ),
            ),
                  ),


          ]),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.07) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                backgroundColor: AppStyle.primaryColor,
                onPressed: (){
                  // print(currentPosition);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                ),

                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppStyle.primaryColor,
                      borderRadius: BorderRadius.circular(45)
                  ),
                  child: Image.asset("assets/images/Group 4371.png",fit: BoxFit.cover,),
                ),
              ),
              SizedBox(height: 13,),
              Container(
                color: Colors.white,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 7,),
                    SvgPicture.asset(
                      "assets/images/Point On Map.svg",
                      fit: BoxFit.cover,
                    ),SizedBox(width: 7,),
                    Text(
                      "Mansoura",
                      style: TextStyle(color: AppStyle.lightBlack, fontSize: 15),
                    ),

                  ],
                ),
              ),
              Container(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0,bottom: 17),
                  child: Text(
                    "Home Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ),
              SizedBox(height: 13,),
              CustomButton(title: "Confirm".tr(), function: (){
                cubit.postAddress();
                // MagicRouter.navigateTo(AddNewAddressPage());
              }, bgColor: AppStyle.primaryColor, textColor: Colors.white)


            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      );
  },
);
  },
)
    );
  }



}


