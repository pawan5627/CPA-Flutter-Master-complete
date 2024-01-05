import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Recomendation extends StatefulWidget {
  final String collectionName;
  final String? uid;

  const Recomendation({Key? key, required this.collectionName, this.uid})
      : super(key: key);

  @override
  State<Recomendation> createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchAndSaveUserData();
  }

  Future<void> fetchAndSaveUserData() async {
    try {
      if (widget.uid != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .get();

        if (userSnapshot.exists) {
          Map<String, dynamic> userData =
              userSnapshot.data() as Map<String, dynamic>;

          // Save user data to variables
          String? noOfVehicle = userData['no_of_vehicle'];
          String? invest = userData['invest'];
          String? empDisaster = userData['emp_disaster'];
          String? safeRoom = userData['safe_room'];
          String? communication = userData['communication'];
          String? alternateTransport = userData['alternate_transport'];
          String? personalsDocuments = userData['personals_documents'];
          String? livingStyle = userData['living_style'];
          String? interested = userData['interested'];

          // Load products based on conditions
          List<Map<String, dynamic>> matchedProducts = [];

          if (noOfVehicle != null) {
            matchedProducts.addAll(await loadProductsForNoOfVehicle());
          }

          if (invest != null) {
            matchedProducts.addAll(await loadProductsForInvest());
          }

          if (empDisaster == 'Yes') {
            matchedProducts.addAll(await loadProductsForempDisaster());
          }

          if (safeRoom == 'Yes') {
            matchedProducts.addAll(await loadProductsForSafeRoom());
          }

          if (communication == 'Yes') {
            matchedProducts.addAll(await loadProductsForCommunication());
          }

          if (alternateTransport == 'Yes') {
            matchedProducts.addAll(await loadProductsForAlternateTransport());
          }

          if (personalsDocuments == 'Yes') {
            matchedProducts.addAll(await loadProductsForPersonalsDocuments());
          }

          if (livingStyle == 'single family home') {
            matchedProducts.addAll(await loadProductsForLivingStyle());
          }

          if (livingStyle == 'Apartment') {
            matchedProducts.addAll(await loadProductsForLivingStyleApartment());
          }

          if (interested == 'Yes') {
            matchedProducts.addAll(await loadProductsForInterested());
          }

          // Print or process the user data
          print('User Data for UID ${widget.uid}:');
          userData.forEach((key, value) {
            print('$key: $value');
          });

          // Print matched products
          print('Matched Products:');
          matchedProducts.forEach((product) {
            print(product);
          });

          // Set the state with matched products
          setState(() {
            products = matchedProducts;
          });
        } else {
          print('User not found for UID ${widget.uid}');
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> loadProductsByCondition(
      String condition) async {
    List<Map<String, dynamic>> matchedProducts = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('recomendation')
          .where('type', isEqualTo: condition)
          .get();

      querySnapshot.docs.forEach((doc) {
        // Add the product to the list
        matchedProducts.add(doc.data() as Map<String, dynamic>);
      });

      // Print or process the matched products
      print('Matched Products for $condition:');
      matchedProducts.forEach((product) {
        print(product);
      });
    } catch (error) {
      print('Error loading products for $condition: $error');
    }

    return matchedProducts;
  }

  Future<List<Map<String, dynamic>>> loadProductsForempDisaster() async {
    return loadProductsByCondition('empdisaster');
  }

  Future<List<Map<String, dynamic>>> loadProductsForNoOfVehicle() async {
    return loadProductsByCondition('no_of_vehicle');
  }

  Future<List<Map<String, dynamic>>> loadProductsForInvest() async {
    return loadProductsByCondition('Barter');
  }

  Future<List<Map<String, dynamic>>> loadProductsForSafeRoom() async {
    return loadProductsByCondition('safeRoom');
  }

  Future<List<Map<String, dynamic>>> loadProductsForCommunication() async {
    return loadProductsByCondition('communication');
  }

  Future<List<Map<String, dynamic>>> loadProductsForAlternateTransport() async {
    return loadProductsByCondition('alternateTransport');
  }

  Future<List<Map<String, dynamic>>> loadProductsForPersonalsDocuments() async {
    return loadProductsByCondition('personalsDocuments');
  }

  Future<List<Map<String, dynamic>>> loadProductsForLivingStyle() async {
    return loadProductsByCondition('single family home');
  }

  Future<List<Map<String, dynamic>>>
      loadProductsForLivingStyleApartment() async {
    return loadProductsByCondition('Apartment');
  }

  Future<List<Map<String, dynamic>>> loadProductsForInterested() async {
    return loadProductsByCondition('NonLethal');
  }

  @override
  Widget build(BuildContext context) {
    print("uid passed to RecomendationScreen: ${widget.uid}");
    print("matched products are: $products");

    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendations'),
      ),
      body: Column(
        children: [
          if (products.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      child: ListTile(
                        title: Row(
                          children: [
                            Image.network(
                              products[index]['image link'] ??
                                  products[index]['image address'] ??
                                  "",
                              width: 130,
                              height: 140,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index]['title'] ??
                                        products[index]['title '] ??
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
                                    products[index]['description'] ??
                                        products[index]['description '] ??
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
                          final String productLink = products[index]
                                  ['product link'] ??
                              products[index]['product link'] ??
                              "";

                          if (productLink.isNotEmpty) {
                            final Uri _url = Uri.parse(productLink);

                            try {
                              // Your launchUrl function goes here
                              // await launchUrl(_url);
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
              ),
            ),
          if (products.isEmpty)
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
