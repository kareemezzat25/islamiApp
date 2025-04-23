abstract class HomeState {}

class HomeInitState extends HomeState {}

class GetPrayTimeLoading extends HomeState {}

class GetPrayTimeError extends HomeState {
  String messageError;
  GetPrayTimeError({required this.messageError});
}

class GetPrayTimeSuccess extends HomeState {}
