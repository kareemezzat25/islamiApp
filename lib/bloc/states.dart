abstract class HomeState {}

class HomeInitState extends HomeState {}

class GetPrayTimeLoading extends HomeState {}

class GetPrayTimeError extends HomeState {
  String messageError;
  GetPrayTimeError({required this.messageError});
}

class GetPrayTimeSuccess extends HomeState {}

class RadioLoadingState extends HomeState {}

class RadioSuccessState extends HomeState {}

class RadioErrorState extends HomeState {
  String messageError;
  RadioErrorState({required this.messageError});
}

class RecitersLoadingState extends HomeState {}

class RecitersErrorState extends HomeState {
  String messageError;
  RecitersErrorState({required this.messageError});
}

class ReciterSuccessState extends HomeState {}
