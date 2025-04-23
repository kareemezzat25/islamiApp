import 'package:bloc/bloc.dart';
import 'package:islami_app/bloc/states.dart';
import 'package:islami_app/models/praytimeResponse.dart';
import 'package:islami_app/repository/repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repo}) : super(HomeInitState());
  Repo repo;
  PrayTimeResponse? prayTimeResponse;
  getPrayTime() async {
    try {
      emit(GetPrayTimeLoading());
      prayTimeResponse = await repo.getPrayTime();
      if (prayTimeResponse!.status == "OK") {
        emit(GetPrayTimeSuccess());
      } else {
        emit(GetPrayTimeError(messageError: prayTimeResponse!.data as String));
      }
    } catch (e) {
      emit(GetPrayTimeError(
          messageError: "SomeThing Went Wrong :${e.toString()}"));
    }
  }
}
