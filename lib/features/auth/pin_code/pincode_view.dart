import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yiki1/features/auth/pin_code/pincode_state.dart';
import 'package:yiki1/features/auth/reset_password2/reset_password2_view.dart';
import 'pincode_cubit.dart';

class PincodePage extends StatelessWidget {
  const PincodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => PinCodeCubit(),
        child: BlocBuilder<PinCodeCubit, PinCodeState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<PinCodeCubit>(context);
    return Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23.0, vertical: 11),
                    child: ListView(children: [
                      const CustomAuthenticationHeader(),
                      const Text(
                        'Reset Your Password',
                        style:
                            TextStyle(color: AppStyle.blackColor, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Please check your email at",
                            style: TextStyle(
                                color: AppStyle.lightBlackColor, fontSize: 16),
                          ),
                          const Text(
                            "michelle.rivera@gmail.com",
                            style: TextStyle(
                                color: AppStyle.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "to receive the password reset code.Kindly enter the code below to proceed."
                                .tr(),
                            style: const TextStyle(
                                color: AppStyle.lightBlackColor, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        "assets/images/Lock Open 5.png",
                        height: MediaQuery.of(context).size.height * 0.15,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PinCodeTextField(
                        controller: cubit.pinCode,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          selectedFillColor:
                              AppStyle.primaryColor.withOpacity(.7),
                          inactiveFillColor: Colors.grey.withOpacity(0.1),
                          inactiveColor: AppStyle.greyColor,
                          activeColor: AppStyle.greyColor,
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(25),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          return true;
                        },
                        appContext: context,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
state is PinCodeLoadingState?const CustomLoading():
                      CustomButton(
                        title: 'Confirm'.tr(),
                        function: () =>cubit.sendPinCode(),
                        bgColor: AppStyle.primaryColor,
                        textColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text(
                              "Resend Code ?".tr(),
                              style: const TextStyle(
                                  color: AppStyle.primaryColor,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ]))));
  },
));
  }
}
