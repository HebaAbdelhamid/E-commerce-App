import 'package:another_stepper/another_stepper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/cart_model/cart_model.dart';
import 'package:yiki1/core/models/couponModel.dart';
import 'package:yiki1/core/models/getAddressModel.dart';
import 'package:yiki1/core/models/paymentModel.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/utils/utils.dart';
import 'package:yiki1/core/models/deleteModel.dart';
import 'complete_order_state.dart';

class CompleteOrderCubit extends Cubit<CompleteOrderState> {
  CompleteOrderCubit() : super(CompleteInitState());
  TextEditingController copoun=TextEditingController();
  var paymentMethod;
  paymentMethod_(_paymentMethod_){
    paymentMethod=_paymentMethod_;
  }
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Select Delivery Address",
        textStyle: TextStyle(
            color: AppStyle.lightBlack,
            fontWeight: FontWeight.bold,
            fontSize: 11),
      ),
      iconWidget: SvgPicture.asset(
        "assets/images/Group 7364.svg",
        fit: BoxFit.cover,
      ),
    ),
    StepperData(
      title: StepperText(
        "Complete Payment",
        textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
      ),
      iconWidget: SvgPicture.asset(
        "assets/images/Vector (Stroke)1.svg",
        fit: BoxFit.cover,
      ),
    )
  ];
 var selectedAddress=0;
  selectedAddress_(address){
    selectedAddress=address;
    emit(SuccesState());
    print(selectedAddress);
  }





  int activeStep = 0;

  changeStep({required int index}) {
    activeStep = index;
    emit(ChangeStepState());
  }
  int selected =0;
  selesctedContainer(int index){
    selected=index;
    emit(SelectedContainer());

  }
  int selectedPayment =0;
  selesctedPayment(int index){
    selectedPayment=index;
    emit(SelectedPaymentMethod());

  }
  GetAddressModel?getAddressResponse;
  getAddress()async{
    emit(LoadingState());
    Response? response = await DioHelper.get("addresses");
    final data = response!.data;
    if (data["status"] == true) {
       getAddressResponse= GetAddressModel.fromJson(data);
// print(getAddressResponse!.data![0].kind);
      emit(SuccesState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
  DeleteModel?deleteResponse;
  deleteItems(int id)async{
    emit(LoadingState());
    Response? response=await DioHelper.delete("addresses/$id");
    final data=response.data as Map<String,dynamic>;

    print('data["status"] ${data["status"]}');
    if(data["status"] == true){
      emit(SuccesState());
      deleteResponse=DeleteModel.fromJson(data);
      print('deleteCartIemResponse ${deleteResponse?.toJson()}');
    }else {
      print('status not true');
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
  PaymentModel? paymentResponse;

  addPaymentMethods(fees,paymentMethod,orderGiftNote) async {
    final body ={
      "address_id":selectedAddress.toString(),
      "shipping_fees":"20",
      "payment_method":paymentMethod,
      "code":copoun.toString()??"tttt",
      "order_type": "Gift",
      "payment_type": "null",
      "order_gift_note": orderGiftNote.toString(),
      "source":"mobile"
    }
    ;
    print("=========${selectedAddress.toString()}");
    Response response = await DioHelper.post("checkout", true, body: body);
    final data = response.data as Map<String, dynamic>;
    print("=======${data.toString()}");

    if (data["status"] == true) {
      // print("=======");
      paymentResponse = PaymentModel.fromJson(data);
      print(paymentResponse!.data!.order!.paymentMethod);
      // print(paymentResponse!.data!.order!.address);

      emit(SuccesState());
    } else {
      emit(ErrorState());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
  CouponModel?couponRsponse;
  addCouponMethods() async {
    final body ={
      "code":copoun.text,
      "products":[

        {
          "id":1,
          "quantity":2,
          "price":300
        }
      ]
    };
    Response response = await DioHelper.post("coupon", true, body: body);
    final data = response.data as Map<String, dynamic>;
    print("=======${data.toString()}");

    if (data["status"] == true) {
       couponRsponse= CouponModel.fromJson(data);
      emit(SuccesState());
    } else {
      emit(ErrorState());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
  CartModel?getCartResponse;
  fetchCartItems()async{
    emit(LoadingState());
    Response? response=await DioHelper.get("get-cart");
    final data=response!.data as Map<String,dynamic>;
    print('data["status"] ${data["status"]}');
    if(data["status"] == true){
      emit(SuccesState());
      getCartResponse=CartModel.fromJson(data);
      print('getCartResponse ${getCartResponse?.toJson()}');
    }else {
      print('status not true');
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }




}
