abstract class BottonNavigationBarState {}
class InitialState extends BottonNavigationBarState{}
class UpdateState extends BottonNavigationBarState{}
class BottonNavigationBarIndexChanged extends BottonNavigationBarState{
  final int newIndex;

  BottonNavigationBarIndexChanged(this.newIndex);
}


