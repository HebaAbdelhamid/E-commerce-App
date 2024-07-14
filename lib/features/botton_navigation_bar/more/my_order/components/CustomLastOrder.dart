import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInInDelivered.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustomOrderICanceled.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_state.dart';

class CustomLastOrder extends StatelessWidget {
  const CustomLastOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderCubit, MyOrderState>(
      builder: (context, state) {
        final cubit=BlocProvider.of<MyOrderCubit>(context);
        return Column(children: [
          SizedBox(height: 22,),
          SizedBox(
            height: 900,
            child:  CustomOrderCanceled(cubit: cubit)

        )]);
      },
    );
  }
}
