import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../data/dummy.dart';

class AuthServices {
// google signin
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (error) {
      throw error;
    }
  }

// Register Users
  static addUser(
      {required uid,
      required name,
      required nickname,
      required dob,
      required number,
      required gender,
      required imgUrl,
      required int changeCounter}) {
    return FirebaseFirestore.instance.collection('users').doc(uid).set({
      "nickname": nickname,
      "f_name": name,
      "dob": dob,
      "number": number,
      "gender": gender,
      "imgUrl": imgUrl,
      "alternate_transport": alternateTransport,
      "basic_technology": basicTechnology,
      "communication": communication,
      "cpa_long": cpaLong,
      "emp_disaster": empdisaster,
      "f_address": fAddress,
      "food_allergies": foodAllergies,
      "get_notify": getNotify,
      "interested": interested,
      "invest": invest,
      "land_size": landSize,
      "living_style": livingStyle,
      "no_of_adults": noOfAdults,
      "no_of_children": noOfChildren,
      "no_of_vehicle": noOfVehicle,
      "personals_documents": personalsDocuments,
      "pets": pets,
      "safe_room": safeRoom,
      "sec_land_size": secLandSize,
      "secondary_location": secondaryLocation,
      "changeCounter": changeCounter,
    }).then((value) {
      print("Add Users");
    }).onError((error, stackTrace) {
      print("Error" + error.toString());
    });
  }

//update user
  static Future<void> updateCPADetails({
    required String uid,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        "number": number,
        "gender": gender,
        "imgUrl": imgUrl,
        "alternate_transport": alternateTransport,
        "basic_technology": basicTechnology,
        "communication": communication,
        "cpa_long": cpaLong,
        "emp_disaster": empdisaster,
        "f_address": fAddress,
        "food_allergies": foodAllergies,
        "get_notify": getNotify,
        "interested": interested,
        "invest": invest,
        "land_size": landSize,
        "living_style": livingStyle,
        "no_of_adults": noOfAdults,
        "no_of_children": noOfChildren,
        "no_of_vehicle": noOfVehicle,
        "personals_documents": personalsDocuments,
        "pets": pets,
        "safe_room": safeRoom,
        "sec_land_size": secLandSize,
        "secondary_location": secondaryLocation,
      });

      print('CPA details updated successfully');
    } catch (e) {
      print('Error updating CPA details: $e');
      // Handle error accordingly
    }
  }

  static Future<void> updateChangeCounter({required String uid}) async {
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(uid);

    try {
      DocumentSnapshot userSnapshot = await userDoc.get();

      if (userSnapshot.exists) {
        int currentCounter = (userSnapshot.data()
                as Map<String, dynamic>?)?['changeCounter'] as int? ??
            0;

        int newCounter = currentCounter + 1;

        await userDoc.update({'changeCounter': newCounter});
      }
    } catch (error) {
      print("Error updating changeCounter: $error");
      // Handle the error as needed
    }
  }

// Store Image
  static Future uploadImage(File imageFile, uid) async {
    try {
      Reference ref = await FirebaseStorage.instance.ref('/users/' +
          uid +
          "/" +
          DateTime.now().millisecondsSinceEpoch.toString());
      UploadTask uploadTask = ref.putFile(imageFile.absolute);
      await uploadTask.whenComplete(() {});
      String url = await ref.getDownloadURL();
      imgUrl = url;
      // Future.value(uploadTask).then((value) async {

      //   // databaseRef.child('1').set({
      //   //   'id' : '1212' ,
      //   //   'title' : newUrl.toString()
      //   // }).then((value){
      //   //   setState(() {
      //   //     loading = false ;
      //   //   });
      //   //   Utils().toastMessage('uploaded');
      // }).onError((error, stackTrace) {
      //   print(error.toString());
      // });
    } catch (e) {
      print(e);
    }
  }

  // Fetch data

  Future<void> fetchData(String userId) async {
    try {
      // Get a reference to the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get a reference to the 'users' collection and the document with the user ID
      DocumentReference userDocRef = firestore.collection('users').doc(userId);

      // Get the data from the document
      DocumentSnapshot userSnapshot = await userDocRef.get();

      // Check if the document exists
      if (userSnapshot.exists) {
        // Access the data using userSnapshot.data()
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        // Now, you can use 'userData' for further processing
        print('User Data: $userData');
      } else {
        // Handle the case where the document does not exist
        print('User with ID $userId does not exist.');
      }
    } catch (e) {
      // Handle any errors
      print('Error fetching data: $e');
    }
  }

  static Future<void> signOutGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      print("Error signing out: $error");
    }
  }
}
