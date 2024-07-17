import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_state.dart';
import 'package:yiki1/features/botton_navigation_bar/component/nav_item.dart';
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
                  backgroundColor: Colors.transparent,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 600),
                  buttonBackgroundColor: AppStyle.primaryColor,
                  index: cubit.currentIndex,
                  items: [
                    NavItem(
                        isActive: cubit.currentIndex == 0,
                        title: "Home",
                        icon: Iconic.home),
                    NavItem(
                        isActive: cubit.currentIndex == 1,
                        title: "Categorie",
                        icon: Icons.category),
                    NavItem(
                        isActive: cubit.currentIndex == 2,
                        title: "Cart",
                        icon: Iconic.credit_card_solid),
                    NavItem(
                        isActive: cubit.currentIndex == 3,
                        title: "More",
                        icon: Iconic.menu_dots_vertical_bold),
                    // Icon(
                    //   Iconic.home_solid,
                    //   color:
                    //       cubit.currentIndex == 0 ? Colors.white : Colors.grey,
                    //   size: 24,
                    // ),



                  ]),
            );
          },
        ));
  }
}
