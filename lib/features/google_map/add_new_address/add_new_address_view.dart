import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/google_map/add_new_address/components/CustomChooseAddress.dart';

import 'add_new_address_cubit.dart';
import 'add_new_address_state.dart';

class AddNewAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AddNewAddressCubit(),
        child: Scaffold(
            body: ListView(children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAuthenticationHeader(),
                    SizedBox(
                      height: 7,
                    ),
                     Text(
                      "Delivery Address".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                     Text(
                      "Your Delivery Addresses list".tr(),
                      style: TextStyle(
                          color: Color(0XFFA2A2A3),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target:
                                LatLng(37.42796133580664, -122.085749655962),
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            // _controller.complete(controller);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                     Text(
                      "Choose Address Type".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomChooseAddress(
                            image: 'Point On Map.svg',
                            text: 'Home',
                            color1: AppStyle.primaryColor,
                            color2: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomChooseAddress(
                            image: 'Point On Map.svg',
                            text: 'Work',
                            color1: Colors.grey.withOpacity(.3),
                            color2: AppStyle.primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomChooseAddress(
                            image: 'Point On Map.svg',
                            text: 'Work',
                            color1: Colors.grey.withOpacity(.3),
                            color2: AppStyle.primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomChooseAddress(
                            image: 'Point On Map.svg',
                            text: 'Work',
                            color1: Colors.grey.withOpacity(.3),
                            color2: AppStyle.primaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(

                      children: [
                        Text("Country".tr(),style: TextStyle(color: AppStyle.lightBlack),),
                        SizedBox(width: MediaQuery.of(context).size.width*.38,),
                        Text("City".tr(),style: TextStyle(color: AppStyle.lightBlack),),

                      ],
                    ),
            Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownMenu(
                            inputDecorationTheme: InputDecorationTheme(
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              constraints: BoxConstraints.tight(
                                  const Size.fromHeight(40)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * .41,
                            hintText: "Select your country ...".tr(),
                            dropdownMenuEntries: [
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                            ]),

                        DropdownMenu(
                            inputDecorationTheme: InputDecorationTheme(
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              constraints: BoxConstraints.tight(
                                  const Size.fromHeight(40)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * .41,
                            hintText: "Select your country ...".tr(),
                            dropdownMenuEntries: [
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                              DropdownMenuEntry(value: "", label: "ttttttttt"),
                            ]),
                      ],
                    ),
                    CustomTextField(
                      upperText: 'Postal Code'.tr(),
                      radius: 5,
                      isNext: true,

                      hint: 'Type postal code ...'.tr(),
                      hintColor: AppStyle.greyColor,
                      // controller: cubit.email,
                      keyboardType: TextInputType.emailAddress,
                      // validator: (value) => cubit.login(),
                    ),
                    CustomTextField(
                      upperText: 'Description'.tr(),
                      radius: 5,
                      isNext: true,
                      maxLines: 5,
                      maxLength: 5,
                      multiLine: true,

                      hint: 'Type Description ...'.tr(),
                      hintColor: AppStyle.greyColor,
                      // controller: cubit.email,
                      keyboardType: TextInputType.emailAddress,
                      // validator: (value) => cubit.login(),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        title: "Confirm".tr(),
                        function: () {},
                        bgColor: AppStyle.primaryColor,
                        textColor: Colors.white),
                  ]))
        ])));
  }
}
