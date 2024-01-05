import 'package:cloud_firestore/cloud_firestore.dart';

class FetchServices {
  static String? docId;
  static dynamic productData;
  // static Future<void> fetchAllDataFromCollection(String collectionName) async {
  //   try {
  //     // Get a reference to the Firestore instance
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;

  //     // Reference the collection from which you want to retrieve all documents
  //     CollectionReference collectionRef = firestore.collection(collectionName);

  //     // Retrieve all documents in the collection
  //     QuerySnapshot querySnapshot = await collectionRef.get();

  //     // Iterate through the documents
  //     querySnapshot.docs.forEach((DocumentSnapshot doc) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       // Process the data as needed
  //       print('Document ID: ${doc.id}, Data: $data');
  //       docId = doc.id;
  //       productData = data;
  //       return;
  //     });
  //   } catch (e) {
  //     // Handle any errors
  //     print('Error fetching data: $e');
  //   }
  // }

  

  static Future<List<Map<String, dynamic>>?> fetchAllDataFromCollection(
      String collectionName) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionRef = firestore.collection(collectionName);

      QuerySnapshot querySnapshot = await collectionRef.get();

      List<Map<String, dynamic>> dataList =
          querySnapshot.docs.map((DocumentSnapshot doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return dataList;
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}



class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> searchProducts(String query) async {
    try {
      // Specify the collections you want to search
      List<String> collections = [
        'bartering resources',
        'car emergency',
        'communication resources',
        'emergency kits',
        'energy resources',
        'food resources',
        'non-lethal protection',
        'services',
        'shelters resources',
        'travel resources',
      ];

      List<Map<String, dynamic>> products = [];

      // Iterate over each collection and fetch products
      for (String collectionName in collections) {
        QuerySnapshot<Map<String, dynamic>> snapshot =
            await _firestore.collection(collectionName).get();

        // Extract product details from each collection
        List<Map<String, dynamic>> productsInCollection =
            snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
          Map<String, dynamic> data = doc.data() ?? {};
          return {
            'title': data['title']?.toString() ?? '',
            'image': data['image link']?.toString() ?? '',
          };
        }).toList();

        products.addAll(productsInCollection);
      }

      return products
          .where((product) =>
              product['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    } catch (e) {
      print('Error searching products: $e');
      return [];
    }
  }
}


 