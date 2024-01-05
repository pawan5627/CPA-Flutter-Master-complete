import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/export.dart';
import 'package:cpa/services/fetch_services.dart';
import 'package:flutter/material.dart';

import 'water_detail_screen.dart';

class WaterResource extends StatefulWidget {
  final String collectionName;

  const WaterResource({Key? key, required this.collectionName})
      : super(key: key);

  @override
  State<WaterResource> createState() => _WaterResourceState();
}

class _WaterResourceState extends State<WaterResource> {
  List<Map<String, dynamic>>? products = [];

  void fetch() async {
    products =
        await FetchServices.fetchAllDataFromCollection(widget.collectionName);
    print(products!.length);
    setState(() {});
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CPAColorTheme().white,
        iconTheme: IconThemeData(color: CPAColorTheme().black),
        title: Text(
          widget.collectionName,
          style: CPATextTheme().heading6.copyWith(color: CPAColorTheme().black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(widget.collectionName)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            var dataLength = snapshot.data!.docs.length;

            return dataLength != 0
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 1,
                      childAspectRatio: 3,
                      mainAxisExtent: 200,
                    ),
                    itemCount: dataLength,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Column(
                            children: [
                              Image.network(
                                snapshot.data!.docs[index]['image link'] ??
                                    snapshot.data!.docs[index]
                                        ['image address'] ??
                                    "",
                                width: 120,
                                height: 120,
                              ),
                              Text(
                                snapshot.data!.docs[index]['title'] ??
                                    snapshot.data!.docs[index]['title '] ??
                                    "Not Found",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WaterDetailScreen(
                                  productLink: products![index],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("Nothing to Show"),
                  );
          }

          if (snapshot.hasError) {
            return Center(
              child: Icon(Icons.error_outline),
            );
          }

          return Container();
        },
      ),
    );
  }
}
