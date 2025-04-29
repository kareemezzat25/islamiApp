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
