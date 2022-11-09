import 'package:store_apps/src/config/db/db_helper.dart';
import 'package:store_apps/src/constants/table_name.dart';
import 'package:store_apps/src/models/store.dart';

class StorageLocalService {
  static Future addStoreToLocalDb(Store store) async {
    var dbClient = await DBHelper.db;

    final response = await dbClient.insert(TableName.tableStore, store.toMap());

    return response;
  }

  static Future<List<Store>> getAllStoresFromLocalDb() async {
    var dbClient = await DBHelper.db; // memanggil database

    List<Map> list =
        await dbClient.rawQuery("SELECT * FROM stores ORDER BY id DESC");
    List<Store> dataStores = [];

    for (int i = 0; i < list.length; i++) {
      var stores = Store(
        storeId: list[i]["store_id"],
        storeCode: list[i]["store_code"],
        storeName: list[i]["store_name"],
        address: list[i]["address"],
        dcId: list[i]["dc_id"],
        dcName: list[i]["dc_name"],
        accountId: list[i]["account_id"],
        accountName: list[i]["account_name"],
        subchannelId: list[i]["subchannel_id"],
        subchannelName: list[i]["subchannel_name"],
        channelId: list[i]["channel_id"],
        channelName: list[i]["channel_name"],
        areaId: list[i]["area_id"],
        areaName: list[i]["area_name"],
        regionId: list[i]["region_id"],
        regionName: list[i]["region_name"],
        latitude: list[i]["latitude"],
        longitude: list[i]["longitude"],
      );

      stores.setIdStore(list[i]["id"]);

      dataStores.add(stores);
    }

    return dataStores;
  }

  static Future<Store> getStoreById(String id) async {
    var dbClient = await DBHelper.db;

    final detailStoreById =
        await dbClient.rawQuery("SELECT * FROM stores WHERE id = $id");

    return Store.fromMap(detailStoreById[0]);
  }

  static Future clearStorageLocal() async {
    var dbClient = await DBHelper.db;

    await dbClient.rawDelete("DELETE FROM stores");

    return true;
  }
}
