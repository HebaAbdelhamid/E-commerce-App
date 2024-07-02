import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yiki1/common_component/custom_Main_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/common_component/header.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/core/validate.dart';
import 'package:yiki1/features/auth/login/state.dart';
import 'package:yiki1/features/auth/reset_password/reset_password_view.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_view.dart';
import '../../../utils/utils.dart';
import '../signup/view1.dart';
import 'cubit.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
            // actions: [
            //   Tooltip(
            //       message: "change_language".tr(),
            //       child: IconButton(
            //           onPressed: () {
            //             LocalizationChecker.changeLanguge(context);
            //           },
            //           icon: const Icon(Icons.language)))
            // ],
            ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<LoginCubit>(context);
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomeHeader(),
                        CustomeMainHeader(
                          mainTitle: 'Login'.tr(),
                          subTitle1: 'Don’t Have an account?'.tr(),
                          subTitle2: 'Create New Account'.tr(),
                          function: () {
                            MagicRouter.navigateTo(SignupPage());
                          },
                        ),
                        CustomTextField(
                          upperText: 'Email Address'.tr(),
                          radius: 5,
                          isNext: true,
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 19.0, right: 7),
                            child: SvgPicture.asset('assets/images/Vector.svg'),
                          ),
                          hint: 'Email Address'.tr(),
                          hintColor: AppStyle.greyColor,
                          controller: cubit.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => Validate.vaidateEmail(value),
                          // validator: (value) => cubit.login(),
                        ),
                        CustomTextField(
                          upperText: 'Password'.tr(),
                          radius: 5,
                          isNext: true,
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 13.0, right: 5),
                            child: SvgPicture.asset('assets/images/Path 8.svg'),
                          ),
                          hint: 'Password'.tr(),
                          secure: true,
                          controller: cubit.password,
                          keyboardType: TextInputType.visiblePassword,
                          // validator: (value) => cubit.login()
                          // Validate.validatePassword(value),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text(
                                "Forget Password ?".tr(),
                                style: TextStyle(
                                    color: AppStyle.primaryColor,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {
                                MagicRouter.navigateTo(ResetPasswordPage());
                              },
                            )
                          ],
                        ),
                        CustomButton(
                          bgColor: AppStyle.primaryColor,
                          textColor: Colors.white,
                          title: 'Login'.tr(),
                          function: () {
                            // cubit.login();
                            // Utils.showSnackBar(context, cubit.login());
                            MagicRouter.navigateTo(BottonNavigationBarPage( ));
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppStyle.lightGREYColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                      color: AppStyle.mainColor2, fontSize: 15),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppStyle.lightGREYColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 20, bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xffEEEEF0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/Google.svg"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Continue With Google".tr(),
                                  style: GoogleFonts.getFont(
                                    "Lato",
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      color: AppStyle.blackColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
