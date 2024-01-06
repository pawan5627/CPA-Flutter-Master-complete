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
      backgroundColor: Colors.white,
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
      body: Column(
        children: [
          Text(
            'Survival Machine has compiled all the best products to help you prepare for any disaster',
            style: CPATextTheme().body1.copyWith(
                color: CPAColorTheme().neutral700, fontWeight: FontWeight.w300),
          ),
          Expanded(
            child: StreamBuilder(
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 1,
                            childAspectRatio: 3,
                            mainAxisExtent: 270,
                          ),
                          itemCount: dataLength,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              shadowColor: Colors.grey.withOpacity(0.5),
                              color: CPAColorTheme().white,
                              surfaceTintColor: Colors.transparent,
                              // color:
                              //     Colors.white, // Set background color to white
                              margin: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Column(
                                  children: [
                                    Image.network(
                                      snapshot.data!.docs[index]
                                              ['image link'] ??
                                          snapshot.data!.docs[index]
                                              ['image address'] ??
                                          "",
                                      width: 160,
                                      height: 160,
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]['title'] ??
                                          snapshot.data!.docs[index]
                                              ['title '] ??
                                          "Not Found",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: CPATextTheme().body.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: CPAColorTheme().black),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]
                                              ['description'] ??
                                          snapshot.data!.docs[index]
                                              ['description '] ??
                                          "Not Found",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: CPATextTheme().extrasmall.copyWith(
                                          color: CPAColorTheme().black),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WaterDetailScreen(
                                                  productLink: products![index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 19,
                                            width:
                                                60, // Adjust the width as needed
                                            decoration: BoxDecoration(
                                              color:
                                                  CPAColorTheme().primaryblue,
                                              borderRadius: BorderRadius.circular(
                                                  4), // Adjust the radius as needed
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Details",
                                                style: CPATextTheme()
                                                    .small
                                                    .copyWith(
                                                        color: CPAColorTheme()
                                                            .white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
          ),
        ],
      ),
    );
  }
}
