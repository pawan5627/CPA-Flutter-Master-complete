import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/export.dart';
import 'package:cpa/services/fetch_services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 
class TrainingProducts extends StatefulWidget {
  final String collectionName;

  const TrainingProducts({Key? key, required this.collectionName})
      : super(key: key);

  @override
  State<TrainingProducts> createState() => _TrainingProductsState();
}

class _TrainingProductsState extends State<TrainingProducts> {
  List<Map<String, dynamic>>? products = [];

  void fetch() async {
    print(widget.collectionName);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Survival Machine has compiled all the best products to help you prepare for any disaster.',
              style: CPATextTheme().headline.copyWith(
                    color: CPAColorTheme().neutral400,
                    fontWeight: FontWeight.w300,
                  ),
            ),
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
                  if (widget.collectionName == "Training Courses" ||
                      widget.collectionName == "Blogs") {
                    // Display horizontal card layout
                    return ListView.builder(
                      itemCount: dataLength,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Row(
                              children: [
                                Image.network(
                                  snapshot.data!.docs[index]['image link'] ??
                                      snapshot.data!.docs[index]
                                          ['image address'] ??
                                      "",
                                  width: 100,
                                  height: 100,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]['title'] ??
                                            snapshot.data!.docs[index]
                                                ['title '] ??
                                            "Not Found",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]
                                                ['description'] ??
                                            snapshot.data!.docs[index]
                                                ['description '] ??
                                            "No description available",
                                        style: TextStyle(fontSize: 14),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              final String productLink = snapshot
                                      .data!.docs[index]['product link'] ??
                                  snapshot.data!.docs[index]['product link'] ??
                                  "";

                              if (productLink.isNotEmpty) {
                                final Uri _url = Uri.parse(productLink);

                                try {
                                  await launchUrl(_url);
                                  print(_url);
                                } catch (e) {
                                  print('Error launching URL: $e');
                                  print('url is :  $_url');
                                }
                              }
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    // Display default grid card layout
                    return GridView.builder(
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
                                  width: 160,
                                  height: 130,
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data!.docs[index]['title'] ??
                                        snapshot.data!.docs[index]['title '] ??
                                        "Not Found",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              final String productLink = snapshot
                                      .data!.docs[index]['product link'] ??
                                  snapshot.data!.docs[index]['product link'] ??
                                  "";

                              if (productLink.isNotEmpty) {
                                final Uri _url = Uri.parse(productLink);

                                try {
                                  await launchUrl(_url);
                                  print(_url);
                                } catch (e) {
                                  print('Error launching URL: $e');
                                  print('url is :  $_url');
                                }
                              }
                            },
                          ),
                        );
                      },
                    );
                  }
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
