class NewOfferState {}
class InitialNewOfferState extends NewOfferState {}
class LoadingCategoryNameState extends NewOfferState {}
class LoadingCategoryState extends NewOfferState {}
class SelectedState extends NewOfferState{}
class SuccessNewOfferState extends NewOfferState {}
class ErroNewOfferState extends NewOfferState {}
class ChangeSelectedAddress extends NewOfferState{}
// class NewOfferState {
//   final String? selectedValue;
//
//   NewOfferState({this.selectedValue});
//   NewOfferState init() {
//     return NewOfferState();
//   }
//
//   NewOfferState clone() {
//     return NewOfferState();
//   }
//   NewOfferState copyWith({String? selectedValue}) {
//     return NewOfferState(
//       selectedValue: selectedValue ?? this.selectedValue,
//     );
//   }
// }
