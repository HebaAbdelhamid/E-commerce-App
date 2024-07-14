abstract class AddNewAddressState {}
class InitialAddNewAddressState extends AddNewAddressState{}
class LoadingAddNewAddressState extends AddNewAddressState{}
class SelectedCountry extends AddNewAddressState{
  final selectedCountry;
  SelectedCountry({this.selectedCountry});
}
class SuccessAddNewAddressState extends AddNewAddressState{}
class ErrorAddNewAddressState extends AddNewAddressState{}
class ChangeSelectedAddress extends AddNewAddressState{}



