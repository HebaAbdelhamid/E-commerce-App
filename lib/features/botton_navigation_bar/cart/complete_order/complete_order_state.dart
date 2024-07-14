abstract class CompleteOrderState {}
class LoadingState extends CompleteOrderState{}

class SelectedContainer extends CompleteOrderState{}
class SelectedPaymentMethod extends CompleteOrderState{}
class SuccesState extends CompleteOrderState {}
class EmptyState extends CompleteOrderState {}

class CompleteInitState extends CompleteOrderState {}

class ChangeStepState extends CompleteOrderState {}

class ErrorState extends CompleteOrderState {}

class GoToComplete extends CompleteOrderState {}
