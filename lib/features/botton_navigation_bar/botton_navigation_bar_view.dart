import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_state.dart';
import 'botton_navigation_bar_cubit.dart';
import 'package:iconic/iconic.dart';

class BottonNavigationBarPage extends StatelessWidget {
  final int currentIndex;

  BottonNavigationBarPage({super.key, this.currentIndex = 0});
//ttttttttt
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            BottonNavigationBarCubit(currentIndex: currentIndex),
        child: BlocBuilder<BottonNavigationBarCubit, BottonNavigationBarState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<BottonNavigationBarCubit>(context);
            return Scaffold(
              body: cubit.pages[cubit.currentIndex],
              bottomNavigationBar: CurvedNavigationBar(
                  onTap: (index) {
                    print(index);
                    // cubit.currentIndex_(index);
                    cubit.currentIndexs(index);
                  },
                  color: Colors.white,
                  // buttonBackgroundColor: AppStyle.primaryColor,
                  backgroundColor: Colors.white,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 600),
                  buttonBackgroundColor: AppStyle.primaryColor,
                  items: [
                    Icon(
                      Iconic.home_solid,
                      color:
                          cubit.currentIndex == 0 ? Colors.white : Colors.grey,
                      size: 24,
                    ),
                    Icon(Icons.category,
                        size: 24,
                        color: cubit.currentIndex == 1
                            ? Colors.white
                            : Colors.grey),
                    Center(
                        child: Icon(
                      Iconic.credit_card_solid,
                      color:
                          cubit.currentIndex == 2 ? Colors.white : Colors.grey,
                      size: 20,
                    )),
                    Icon(
                      Iconic.menu_dots_vertical_bold,
                      color:
                          cubit.currentIndex == 3 ? Colors.white : Colors.grey,
                      size: 24,
                    ),
                  ]),
            );
          },
        ));
  }
}
