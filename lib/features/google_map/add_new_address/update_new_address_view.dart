import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/complete_order/complete_order_cubit.dart';
import 'package:yiki1/features/google_map/add_new_address/components/CustomChooseAddress.dart';
import 'package:yiki1/utils/utils.dart';
import 'add_new_address_cubit.dart';
import 'add_new_address_state.dart';

class UpdateNewAddressPage extends StatelessWidget {
  List kind = ['Home', 'Work', 'temporary'];

  UpdateNewAddressPage(this.cubit, {int? index, super.key});
  final CompleteOrderCubit cubit;
  late var country='Select your Country ...'.tr();
  late var city='Select your City ...'.tr();
  int? indexx;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNewAddressCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: BlocBuilder<AddNewAddressCubit, AddNewAddressState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<AddNewAddressCubit>(context);
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomAuthenticationHeader(),
                      const SizedBox(height: 7),
                      Text(
                        "Update Your Delivery Address".tr(),
                        style: const TextStyle(
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Your Delivery Addresses list".tr(),
                        style: const TextStyle(
                            color: Color(0XFFA2A2A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 13),
                      Container(
                        height: MediaQuery.of(context).size.height * .18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: const CameraPosition(
                              target:
                                  LatLng(37.42796133580664, -122.085749655962),
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              // _controller.complete(controller);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      Text(
                        "Choose Address Type".tr(),
                        style: const TextStyle(
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    cubit.selectkind(kind[index]);
                                    cubit.changeSelectedIndex(index);
                                  },
                                  child: CustomChooseAddress(
                                    image: 'Point On Map.svg',
                                    text: kind[index],
                                    color1: index == cubit.selectedIndex
                                        ? AppStyle.primaryColor
                                        : AppStyle.lightGrey,
                                    color2: index == cubit.selectedIndex
                                        ? Colors.white
                                        : AppStyle.primaryColor,
                                    width: 140,
                                  ),
                                ),
                            separatorBuilder: (context, index) => const SizedBox(
                                  width: 7,
                                ),
                            itemCount: 3),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            "Country".tr(),
                            style: const TextStyle(color: AppStyle.lightBlack),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .38,
                          ),
                          Text(
                            "City".tr(),
                            style: const TextStyle(color: AppStyle.lightBlack),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.getCountryByName(name: "");
                              Utils.showBottonSheetCountries(
                                context,
                                widget: BlocBuilder(
                                  bloc: cubit,
                                  builder: (context, state) {
                                    if (state is LoadingAddNewAddressState) {
                                      return const CustomLoading();
                                    } else {
                                      return SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, top: 18, right: 18),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomTextField(
                                                onChanged: (value) {
                                                  cubit.getCountryByName(
                                                      name: value);
                                                },
                                                controller: cubit.country,
                                                upperText:
                                                    'Choose Country'.tr(),
                                                radius: 5,
                                                isNext: true,

                                                hint: 'Choose Country ...'.tr(),
                                                hintColor: AppStyle.greyColor,
                                                // controller: cubit.email,
                                                keyboardType: TextInputType.emailAddress,
                                                // validator: (value) => cubit.login(),
                                              ),
                                              const SizedBox(height: 7),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .3,
                                                child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            cubit.selectCountry(cubit.countryResponse!.data![index].id);
                                                            country=cubit.countryResponse!.data![index].name!;

                                                            cubit
                                                                .countryResponse!
                                                                .data![index]
                                                                .id;
                                                          },
                                                          child: Text(
                                                            "${cubit.countryResponse!.data![index].name}",
                                                            style: const TextStyle(
                                                                color: AppStyle
                                                                    .blackColor,
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                        const Divider(
                                                          color: AppStyle
                                                              .greyColor,
                                                        )
                                                      ],
                                                    );
                                                  },
                                                  itemCount: cubit
                                                      .countryResponse!
                                                      .data!
                                                      .length,
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return const SizedBox(
                                                        height: 7);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              height: 69,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(country,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              cubit.getCityByName(name: "");
                              Utils.showBottonSheetCountries(
                                context,
                                widget: BlocBuilder(
                                  bloc: cubit,
                                  builder: (context, state) {
                                    if (state is LoadingAddNewAddressState) {
                                      return const CustomLoading();
                                    } else {
                                      return SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, top: 18, right: 18),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.end,
                                              //   children: [
                                              //     IconButton(onPressed: (){
                                              //       MagicRouter.pop();
                                              //     }, icon: Icon(Icons.close,color: Colors.red,size: 17,)
                                              //     ),
                                              //
                                              //   ],
                                              // ),
                                              CustomTextField(
                                                onChanged: (value) {
                                                  cubit.getCityByName(
                                                      name: value);
                                                },
                                                controller: cubit.city,
                                                upperText: 'Choose City'.tr(),
                                                radius: 5,
                                                isNext: true,

                                                hint: 'Choose City ...'.tr(),
                                                hintColor: AppStyle.greyColor,
                                                // controller: cubit.email,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                // validator: (value) => cubit.login(),
                                              ),
                                              const SizedBox(height: 7),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .3,
                                                child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            cubit.selectCity(cubit.cityResponse!.data![index].id);
                                                            city=cubit.cityResponse!.data![index].name!;

                                                          },
                                                          child: Text(
                                                            "${cubit.cityResponse!.data![index].name}",
                                                            style: const TextStyle(
                                                                color: AppStyle
                                                                    .blackColor,
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                        const Divider(
                                                          color: AppStyle
                                                              .greyColor,
                                                        )
                                                      ],
                                                    );
                                                  },
                                                  itemCount: cubit
                                                      .countryResponse!
                                                      .data!
                                                      .length,
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return const SizedBox(
                                                        height: 7);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * .4,
                                height: 69,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                    child: Text(city,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ))),
                          ),
                        ],
                      ),
                      CustomTextField(
                        controller: cubit.postalCode,
                        upperText: 'Postal Code'.tr(),
                        radius: 5,
                        isNext: true,

                        hint: 'Type postal code ...'.tr(),
                        hintColor: AppStyle.greyColor,
                        // controller: cubit.email,
                        keyboardType: TextInputType.emailAddress,
                        // validator: (value) => cubit.login(),
                        // initialValue: cubit.addAddressResponse!.data!.address??"1",
                      ),
                      CustomTextField(
                        controller: cubit.description,
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
                      const SizedBox(height: 50),
                      CustomButton(
                          title: "Confirm".tr(),
                          function: () {
                            cubit.postAddress();
                            cubit.updateAddress(indexx!);
                          },
                          bgColor: AppStyle.primaryColor,
                          textColor: Colors.white),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
