import 'package:flutter/material.dart';
import 'package:store_apps/src/models/store.dart';
import 'package:store_apps/src/screens/detail_store.dart';

class ItemStore extends StatelessWidget {
  const ItemStore({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailStore(idStore: store.id))
      ),
      title: Text(store.storeName),
    );
  }
}
