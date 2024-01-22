part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class LoadingState extends MainState {}

final class ErrorState extends MainState {
  final String error;

  ErrorState({required this.error});
}

final class GeoPositionFetched extends MainState {
  final Position position;

  GeoPositionFetched({required this.position});
}
