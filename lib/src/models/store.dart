class Store {
  late int id;
  late String storeId,
      storeCode,
      storeName,
      address,
      dcId,
      dcName,
      accountId,
      accountName,
      subchannelId,
      subchannelName,
      channelId,
      channelName,
      areaId,
      areaName,
      regionId,
      regionName,
      latitude,
      longitude;

  Store(
      {this.storeId = "",
      this.storeCode = "",
      this.storeName = "",
      this.address = "",
      this.dcId = "",
      this.dcName = "",
      this.accountId = "",
      this.accountName = "",
      this.subchannelId = "",
      this.subchannelName = "",
      this.channelId = "",
      this.channelName = "",
      this.areaId = "",
      this.areaName = "",
      this.regionId = "",
      this.regionName = "",
      this.latitude = "",
      this.longitude = ""});

  Store.fromMap(dynamic map) {
    this.storeId = map["store_id"];
    this.storeCode = map["store_code"];
    this.storeName = map["store_name"];
    this.address = map["address"];
    this.dcId = map["dc_id"];
    this.dcName = map["dc_name"];
    this.accountId = map["account_id"];
    this.accountName = map["account_name"];
    this.subchannelId = map["subchannel_id"];
    this.subchannelName = map["subchannel_name"];
    this.channelId = map["channel_id"];
    this.channelName = map["channel_name"];
    this.areaId = map["area_id"];
    this.areaName = map["area_name"];
    this.regionId = map["region_id"];
    this.regionName = map["region_name"];
    this.latitude = map["latitude"];
    this.longitude = map["longitude"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map["store_id"] = storeId;
    map["store_code"] = storeCode;
    map["store_name"] = storeName;
    map["address"] = address;
    map["dc_id"] = dcId;
    map["dc_name"] = dcName;
    map["account_id"] = accountId;
    map["account_name"] = accountName;
    map["subchannel_id"] = subchannelId;
    map["subchannel_name"] = subchannelName;
    map["channel_id"] = channelId;
    map["channel_name"] = channelName;
    map["area_id"] = areaId;
    map["area_name"] = areaName;
    map["region_id"] = regionId;
    map["region_name"] = regionName;
    map["latitude"] = latitude;
    map["longitude"] = longitude;

    return map;
  }

  void setIdStore(int id){
    this.id = id;
  }
}
