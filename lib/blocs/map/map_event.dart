part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializedEvent extends MapEvent {
  final GoogleMapController controller;

  const OnMapInitializedEvent(this.controller);
}

class OnStopFollowingUserEvent extends MapEvent {}

class OnStartFollowingUserEvent extends MapEvent {}

class OnUpdateUserPolylinesEvent extends MapEvent {
  final List<LatLng> userLocations;

  const OnUpdateUserPolylinesEvent(this.userLocations);
}

class OnToggleUserRouteEvent extends MapEvent {}
