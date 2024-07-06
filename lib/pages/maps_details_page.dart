import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:rent_car_concept/provider/location_provider.dart';
import 'package:rent_car_concept/theme/icons/app_icons.dart';
import 'package:rent_car_concept/widgets/car_maps_details.dart';

@RoutePage()
class MapsDetailsPage extends StatefulWidget {
  const MapsDetailsPage({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  State<MapsDetailsPage> createState() => _MapsDetailsPageState();
}

class _MapsDetailsPageState extends State<MapsDetailsPage> {
  late Future<LatLng> latLngFuture;

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false)
        .getLatLng(widget.car.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
        if (locationProvider.latLng == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final latLng = locationProvider.latLng!;
          return Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                    initialZoom: 13,
                    initialCenter: latLng,
                    interactionOptions: const InteractionOptions(
                        flags: ~InteractiveFlag.doubleTapZoom)),
                children: [
                  openStreetMapTileLayer,
                  const MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(1.286, 103.432),
                        width: 60,
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: AppIcons.location,
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CarMapsDetails(car: widget.car),
              ),
            ],
          );
        }
      }),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    );
