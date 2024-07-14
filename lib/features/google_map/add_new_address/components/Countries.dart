import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/features/google_map/add_new_address/add_new_address_cubit.dart';
import 'package:yiki1/features/google_map/add_new_address/add_new_address_state.dart';

class Countries extends StatelessWidget {
  Countries({super.key,required this.cubit});
  @override
  var cubit;
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewAddressCubit, AddNewAddressState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return Text("${cubit.countryResponse!.data![index].name}");
          },
          itemCount: 7,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 7,
            );
          },
        );
      },
    );
  }
}
