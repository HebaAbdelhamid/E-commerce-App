class NewOfferState {
  final String? selectedValue;

  NewOfferState({this.selectedValue});
  NewOfferState init() {
    return NewOfferState();
  }

  NewOfferState clone() {
    return NewOfferState();
  }
  NewOfferState copyWith({String? selectedValue}) {
    return NewOfferState(
      selectedValue: selectedValue ?? this.selectedValue,
    );
  }
}
