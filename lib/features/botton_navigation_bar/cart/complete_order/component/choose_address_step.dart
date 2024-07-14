import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/features/google_map/add_new_address/add_new_address_view.dart';
import 'package:yiki1/features/google_map/add_new_address/update_new_address_view.dart';

import '../../../../../common_component/CstomOrderPlace.dart';
import '../../../../../core/styles.dart';
import '../complete_order_cubit.dart';
import '../complete_order_state.dart';

class ChooseAddressStep extends StatelessWidget {
  const ChooseAddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
      child: BlocBuilder<CompleteOrderCubit, CompleteOrderState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<CompleteOrderCubit>(context);

          return Column(
            children: [
              state is LoadingState?CustomLoading():
              SizedBox(
                height: 280,
                width: 500,
                child: CustomAddress(cubit: cubit),
              ),
              SizedBox(
                height: 11,
              ),
              InkWell(
                onTap: (){
                  MagicRouter.navigateTo(AddNewAddressPage());
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/Add Circle.svg",
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Add New Address",
                      style:
                          TextStyle(color: AppStyle.primaryColor, fontSize: 15),
                    )
                  ],
                ),
              ),
              CustomButton(
                  title: "Continue to checkout",
                  function: () {
                    cubit.changeStep(index: 1);

                  },
                  bgColor: AppStyle.primaryColor,
                  textColor: Colors.white)
            ],
          );
        },
      ),
    );
  }
}

class CustomAddress extends StatelessWidget {
  const CustomAddress({
    super.key,
    required this.cubit,
  });

  final CompleteOrderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          int? indexx=cubit.getAddressResponse!.data![index].id;

          return InkWell(
            onTap: () {
              cubit.selesctedContainer(index);
              cubit.selectedAddress_(indexx);
            },
            child: CustomeOrderPlace(
              text1: "${cubit.getAddressResponse!.data![index].kind}",
              text2: "${cubit.getAddressResponse!.data![index].country}",
              text3: "${cubit.getAddressResponse!.data![index].city}",
              text4: "set as a default",
              color:
                  cubit.selected == index ? AppStyle.primaryColor : Colors.grey,
           function: (){

             cubit.deleteItems(indexx!);
                cubit.getAddressResponse!.data![index].id;
                print(cubit.getAddressResponse!.data![index].id.runtimeType);
                },
              function_: ()=>MagicRouter.navigateTo(UpdateNewAddressPage(index: indexx,cubit)),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 7,
          );
        },
        itemCount: cubit.getAddressResponse!.data!.length
    );
  }
}
