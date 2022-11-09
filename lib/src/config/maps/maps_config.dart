import 'package:syncfusion_flutter_maps/maps.dart';

class MapsConfig {
  static setMapSource() {
    return const MapShapeSource.asset("assets/indonesia.json",
        shapeDataField: "name");
  }

  static setZoomPan() {
    return MapZoomPanBehavior(
      focalLatLng: const MapLatLng(-6.3121137, 106.9544459),
      zoomLevel: 8,
    );
  }
}
