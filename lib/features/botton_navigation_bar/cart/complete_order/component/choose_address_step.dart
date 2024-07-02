import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yiki1/common_component/custom_button.dart';

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
              SizedBox(
                height: 380,
                width: 500,
                child: CustomAddress(cubit: cubit),
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/Add Circle.svg",
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Add New Address",
                    style:
                        TextStyle(color: AppStyle.primaryColor, fontSize: 15),
                  )
                ],
              ),
              CustomButton(
                  title: "Continue to checkout",
                  function: () => cubit.changeStep(index: 1),
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
          return InkWell(
            onTap: () {
              cubit.selesctedContainer(index);
            },
            child: CustomeOrderPlace(
              text1: "Home",
              text2: "Mansoura,",
              text3: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
              text4: "set as a default",
              color:
                  cubit.selected == index ? AppStyle.primaryColor : Colors.grey,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 7,
          );
        },
        itemCount: 2);
  }
}
