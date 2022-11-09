import 'package:flutter/material.dart';
import 'package:store_apps/src/constants/label_name.dart';
import 'package:store_apps/src/models/store.dart';
import 'package:store_apps/src/services/storage_local_service.dart';

class DetailStore extends StatefulWidget {
  const DetailStore({Key? key, required this.idStore}) : super(key: key);

  final int idStore;

  @override
  State<DetailStore> createState() => _DetailStoreState();
}

class _DetailStoreState extends State<DetailStore> {
  Store store = Store();

  void getDetailStore() async {
    final dataStore =
        await StorageLocalService.getStoreById(widget.idStore.toString());

    setState(() {
      store = dataStore;
    });
  }

  @override
  void initState() {
    super.initState();

    getDetailStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LabelName.labelDetailStore),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: const Center(
                  child: Text("Image"),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            )
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(store.storeName),
                          Text(store.address),
                          Text(store.dcName),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 40,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: Colors.redAccent),
                            child: const Center(
                              child: Text(LabelName.labelButtonNoVisit),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 40,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: Colors.blueAccent),
                            child: const Center(
                              child: Text(LabelName.labelButtonVisit),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.33,
              right: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.redAccent, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.orangeAccent, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.greenAccent, shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
