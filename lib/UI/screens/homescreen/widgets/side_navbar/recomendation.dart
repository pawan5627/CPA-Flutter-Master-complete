import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/export.dart';
 import 'package:url_launcher/url_launcher.dart';

class RecomendationScreen extends StatefulWidget {
  final String collectionName;
  final String? uid;

  const RecomendationScreen({Key? key, required this.collectionName, this.uid})
      : super(key: key);

  @override
  State<RecomendationScreen> createState() => _RecomendationScreenState();
}

class _RecomendationScreenState extends State<RecomendationScreen> {
  bool showCommunicationRecommendations = false;
  bool showInvestRecommendations = false;
  String? userLivingStyle;
  bool includeVehicleRecommendations = false; // Add this line
  bool showNonlethalRecommendations = false;
  bool includsafeRoomRecommendations = false; // Add this line
  bool includalternateTransportRecommendations = false; // Add this line
  bool includpersonalsDocumentsRecommendations = false; // Add this line
  bool includempdisasterRecommendations = false;

  void checkUserData() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get();
    if (userSnapshot.exists) {
      // Check if communication is set to 'yes'
      showCommunicationRecommendations = userSnapshot['communication'] == 'yes';

      // Check if invest is not null
      bool hasInvest = userSnapshot['invest'] != null;
      print(" has in vest is : $hasInvest");

      // Set the flag to show recommendations based on invest
      showInvestRecommendations = hasInvest;

      // Retrieve and store user's living_style
      userLivingStyle = userSnapshot['living_style'];

      // Retrieve and store user's no_of_vehicle
      String? userNoOfVehicle = userSnapshot['no_of_vehicle'];

      // Add the condition to include vehicle recommendations
      includeVehicleRecommendations = userNoOfVehicle != null;

      print(" includeVehicleRecommendations: $includeVehicleRecommendations");

      showNonlethalRecommendations = userSnapshot['interested'] == 'Yes';

      includsafeRoomRecommendations = userSnapshot['safe_room'] == 'Yes';
      print("includsafeRoomRecommendations is: $includsafeRoomRecommendations");

      includpersonalsDocumentsRecommendations =
          userSnapshot['personals_documents'] == 'Yes';

      includalternateTransportRecommendations =
          userSnapshot['alternate_transport'] == 'Yes';

      includempdisasterRecommendations = userSnapshot['emp_disaster'] == 'Yes';
      setState(() {});
    }
  }

  @override
  void initState() {
    checkUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("uid passed to RecomendationScreen: ${widget.uid}");
    print(
        'showCommunicationRecommendations: $showCommunicationRecommendations');
    print('showInvestRecommendations: $showInvestRecommendations');
    print('userLivingStyle is  : $userLivingStyle');

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
                  var filteredData = snapshot.data!.docs.where((doc) {
                   
 
                    // Include communication and invest recommendations
                    bool includeCommunication =
                        !showCommunicationRecommendations ||
                            doc['type'] == 'communication' ||
                            (showInvestRecommendations &&
                                doc['type'] == 'Barter');

                    // Include recommendations based on user's living style
                    // Include recommendations based on user's living style
                    bool includeLivingStyle = userLivingStyle == null ||
                        doc['type'].toString().trim() == userLivingStyle;

// Include vehicle recommendations if the user has specified the number of vehicles
                    bool includeVehicle = includeVehicleRecommendations &&
                        doc['type'].toString().trim() == 'no_of_vehicle';

// Include nonlethal recommendations if the user is interested
                    bool includeNonlethal = showNonlethalRecommendations &&
                        doc['type'].toString().trim() == 'NonLethal';

                    bool includeSaferoom = includsafeRoomRecommendations &&
                        doc['type'].toString().trim() == 'safeRoom';

                    bool includepersonalsDocuments =
                        includpersonalsDocumentsRecommendations &&
                            doc['type'].toString().trim() ==
                                'personalsDocuments';

                    bool includealternateTransport =
                        includalternateTransportRecommendations &&
                            doc['type'].toString().trim() ==
                                'alternateTransport';

                    bool includeempdisaster =
                        includempdisasterRecommendations &&
                            doc['type'].toString().trim() == 'empdisaster';

                    // Print the results of each condition for debugging
                    print("includeCommunication: $includeCommunication");
                    print("includeLivingStyle: $includeLivingStyle");
                    print("includeVehicle: $includeVehicle");
                    print("includeNonlethal: $includeNonlethal");
                    print("includeSaferoom: $includeSaferoom");
                    print(
                        "includepersonalsDocuments: $includepersonalsDocuments");
                    print(
                        "includealternateTransport: $includealternateTransport");
                    print("includeempdisaster: $includeempdisaster");

                    // Combine the conditions
                    return includeCommunication ||
                        includeLivingStyle ||
                        includeVehicle ||
                        includeSaferoom ||
                        includepersonalsDocuments ||
                        includealternateTransport ||
                        includeempdisaster ||
                        includeNonlethal;
                  }).toList();

                  print("no of items in filteredData are : $filteredData");
                  return ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(
                          "Item at index $index: ${filteredData[index].data()}");

                      return Card(
                        child: SizedBox(
                          child: ListTile(
                            title: Row(
                              children: [
                                Image.network(
                                  filteredData[index]['image link'] ??
                                      filteredData[index]['image address'] ??
                                      "",
                                  width: 130,
                                  height: 140,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filteredData[index]['title'] ??
                                            filteredData[index]['title '] ??
                                            "Not Found",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Text(
                                        filteredData[index]['description'] ??
                                            filteredData[index]
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
                              final String productLink = filteredData[index]
                                      ['product link'] ??
                                  filteredData[index]['product link'] ??
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
                        ),
                      );
                    },
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
