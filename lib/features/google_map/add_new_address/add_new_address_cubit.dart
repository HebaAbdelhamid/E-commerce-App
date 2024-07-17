import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/addAddress.dart';
import 'package:yiki1/core/models/cityModel.dart';
import 'package:yiki1/core/models/countryModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'add_new_address_state.dart';

class AddNewAddressCubit extends Cubit<AddNewAddressState> {

  AddNewAddressCubit() : super(InitialAddNewAddressState());
  TextEditingController postalCode = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();

  int selectedIndex = 0;

  changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedAddress());
  }


  AddAddressModel?addAddressResponse;
  var selectedcountry;
  void selectCountry( country) {
    selectedcountry=country;
    print(selectedcountry .toString());
    emit(SelectedCountry(selectedCountry: country));
  }
  var selectedKind;
  void selectkind( kind) {
    selectedKind=kind;
    print(kind);
    emit(SelectedCountry(selectedCountry: country));
  }
  var selectedcity;
  void selectCity( city) {
    selectedcity=city;
    print(selectedcity .toString().runtimeType);
    emit(SelectedCountry(selectedCountry: country));
  }
  CountryModel?countryResponse;
  CityModel?cityResponse;
  Future<void>postAddress()async{
    emit(LoadingAddNewAddressState());
    final body = {
     "name":postalCode.text,
      "nearest_place":"nearest_place",
      "address":description.text,
      "lat":"30.423423423423423",
      "lng":"50.4234234234234",
      "city_id":selectedcity.toString()??"1",
      "kind":selectedKind??"home",
      "is_default":"0",
      "country_id":selectedcountry.toString()??"1",
    };
    Response response = await DioHelper.post("addresses", true, body: body);
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      addAddressResponse = AddAddressModel.fromJson(data);
       print(addAddressResponse!.data!.toJson());
      emit(SuccessAddNewAddressState());
      Utils.showSnackBar(data["message"] ?? "Successfully added");

    } else {
      emit(ErrorAddNewAddressState());
      Utils.showSnackBar(data["message"] ?? "Error");
    }

  }
  Future<void>updateAddress(int id)async{
    emit(LoadingAddNewAddressState());
    final body = {
      "_method":"put",
      "name":"test",
      "is_default":"1"
    };
    Response response = await DioHelper.post("addresses/$id", true, body: body);
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      addAddressResponse = AddAddressModel.fromJson(data);
      print(addAddressResponse!.data!.toJson());
      emit(SuccessAddNewAddressState());
    } else {
      emit(ErrorAddNewAddressState());
      Utils.showSnackBar(data["message"] ?? "Error");
    }

  }

  getCountryByName({String? name})async{
    emit(LoadingAddNewAddressState());
    Response? response=await DioHelper.get("countries?name=$name");
    print(response.toString());
    final data=response!.data;
    if(data["status"]==true){
      print("truetruetruetruetruetrue");
      countryResponse=CountryModel.fromJson(data);
      print(countryResponse!.data);
      emit(SuccessAddNewAddressState());

      print("Success${countryResponse!.data.toString()}");
    }else{
      emit(ErrorAddNewAddressState());
      Utils.showSnackBar(data["message"]??"Error");
    }
  }
  getCityByName({String? name})async{
    emit(LoadingAddNewAddressState());
    Response? response=await DioHelper.get("cities?name=$name");
    print(response.toString());
    final data=response!.data;
    if(data["status"]==true){
      print("truetruetruetruetruetrue");
      cityResponse=CityModel.fromJson(data);
      print(cityResponse!.data);
      emit(SuccessAddNewAddressState());

      print("Success${countryResponse!.data.toString()}");
    }else{
      emit(ErrorAddNewAddressState());
      Utils.showSnackBar(data["message"]??"Error");
    }
  }


}
