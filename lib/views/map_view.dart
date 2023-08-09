import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;

  const MapView(
      {super.key, required this.initialLocation, required this.polylines});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final CameraPosition initialCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          onPointerMove: (pointerMoveEvent) {
            mapBloc.add(OnStopFollowingUserEvent());
          },
          child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            compassEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onMapCreated: (controller) =>
                mapBloc.add(OnMapInitializedEvent(controller)),
          ),
        ));
  }
}
