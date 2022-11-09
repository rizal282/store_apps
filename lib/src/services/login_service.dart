import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_apps/src/config/url/base_url.dart';
import 'package:store_apps/src/constants/end_point.dart';
import 'package:store_apps/src/models/store.dart';
import 'package:store_apps/src/services/storage_local_service.dart';

class LoginService {
  static Future<bool> loginUser(String username, String password) async {
    String urlLogin = BaseUrl.getUrl() + EndPoint.login;

    try {
      final response = await http.post(Uri.parse(urlLogin), body: {
        "username": username,
        "password": password
      });

      if (response.statusCode == 200) {

        final resultStores = json.decode(response.body)["stores"];

        for (int i = 0; i < resultStores.length; i++) {

          final storeData = Store(
            storeId: resultStores[i]["store_id"],
            storeCode: resultStores[i]["store_code"],
            storeName: resultStores[i]["store_name"],
            address: resultStores[i]["address"],
            dcId: resultStores[i]["dc_id"],
            dcName: resultStores[i]["dc_name"],
            accountId: resultStores[i]["account_id"],
            accountName: resultStores[i]["account_name"],
            subchannelId: resultStores[i]["subchannel_id"],
            subchannelName: resultStores[i]["subchannel_name"],
            channelId: resultStores[i]["channel_id"],
            channelName: resultStores[i]["channel_name"],
            areaId: resultStores[i]["area_id"],
            areaName: resultStores[i]["area_name"],
            regionId: resultStores[i]["region_id"],
            regionName: resultStores[i]["region_name"],
            latitude: resultStores[i]["latitude"],
            longitude: resultStores[i]["longitude"],
          );

          StorageLocalService.addStoreToLocalDb(storeData);
        }

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
