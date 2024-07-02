abstract class CompleteOrderState {}
class SelectedContainer extends CompleteOrderState{}
class SelectedPaymentMethod extends CompleteOrderState{}
class SuccesfullState extends CompleteOrderState {}

class CompleteInitState extends CompleteOrderState {}

class ChangeStepState extends CompleteOrderState {}

class ErrorState extends CompleteOrderState {}

class GoToComplete extends CompleteOrderState {}
