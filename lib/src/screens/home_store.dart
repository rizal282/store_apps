import 'package:flutter/material.dart';
import 'package:store_apps/src/config/maps/maps_config.dart';
import 'package:store_apps/src/constants/label_name.dart';
import 'package:store_apps/src/models/store.dart';
import 'package:store_apps/src/models/store_marker.dart';
import 'package:store_apps/src/screens/login.dart';
import 'package:store_apps/src/services/storage_local_service.dart';
import 'package:store_apps/src/widgets/item_store.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({Key? key}) : super(key: key);

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  late MapShapeSource _mapShapeSource;
  late MapZoomPanBehavior _zoomPanBehavior;

  List<Store> storeListData = [];
  List<StoreMarker> storeMarkerList = [];

  Future<List<Store>> setStoreData() async {
    storeListData = await StorageLocalService.getAllStoresFromLocalDb();

    for (int i = 0; i < storeListData.length; i++) {
      storeMarkerList.add(StoreMarker(
          latitude: double.parse(storeListData[i].latitude),
          longitude: double.parse(storeListData[i].longitude)));
    }

    return storeListData;
  }

  void logoutStore() async {
    final clearStores = await StorageLocalService.clearStorageLocal();

    if (clearStores) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();

    _mapShapeSource = MapsConfig.setMapSource();
    _zoomPanBehavior = MapsConfig.setZoomPan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LabelName.labelListStore),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () => logoutStore(),
                    child: const Text(LabelName.labelLogout))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: SfMaps(
                layers: [
                  MapShapeLayer(
                    source: _mapShapeSource,
                    initialMarkersCount: 1,
                    zoomPanBehavior: _zoomPanBehavior,
                    markerBuilder: (context, i) => const MapMarker(
                      latitude: -6.3121137,
                      longitude: 106.9544459,
                      iconColor: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: FutureBuilder(
                future: setStoreData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: storeListData.length,
                      itemBuilder: (context, i) =>
                          ItemStore(store: storeListData[i]),
                    );
                  }

                  return const Center(
                    child: Text(LabelName.labelNoData),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
