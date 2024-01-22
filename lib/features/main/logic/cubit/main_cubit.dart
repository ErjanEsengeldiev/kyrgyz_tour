import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kyrgyz_tour/geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  void getGeoLocation() async {
    emit(LoadingState());
    await AppGeolocator.determinePosition().then((value) {
      emit(GeoPositionFetched(position: value));
    }).onError((error, stackTrace) {
      emit(ErrorState(error: error.toString()));
    });
  }
}
