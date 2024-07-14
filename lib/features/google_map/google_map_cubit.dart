import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/addAddress.dart';
import 'package:yiki1/features/google_map/google_map_state.dart';
import 'package:yiki1/utils/utils.dart';


class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(InitialState());
  AddAddressModel?addAddressResponse;

  postAddress()async{
    emit(LoadingState());
    final body = {
      "name":"name",
      "nearest_place":"nearest_place",
      "address":"address",
      "lat":"30.423423423423423",
      "lng":"50.4234234234234",
      "city_id":"1",
      "kind":"work",
      "is_default":"0",
      "country_id":"1",
    };
    Response response = await DioHelper.post("addresses", true, body: body);
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      print("=======");
      addAddressResponse = AddAddressModel.fromJson(data);
      print(addAddressResponse!.data!.name);
      // print(addAddressResponse!.data!.order!.items!.length);

      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data["message"] ?? "Error");
    }

  }


// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//   return await Geolocator.getCurrentPosition();
// }

}
