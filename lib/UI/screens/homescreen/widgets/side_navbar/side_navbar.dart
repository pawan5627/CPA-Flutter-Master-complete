import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/UI/screens/homescreen/widgets/side_navbar/edit_profile.dart';
import 'package:cpa/UI/screens/homescreen/widgets/side_navbar/privacy_policy.dart';
 import 'package:cpa/services/auth_services.dart';
import 'package:cpa/services/shared_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/dummy.dart';
import '../../../../../export.dart';
import '../../../../../subscriptions/subscription_plans.dart';
import '../../../Analysis/analysis_page1.dart';

class SideNavbar extends StatefulWidget {
  final String? uid;

  const SideNavbar({
    super.key,
    this.uid,
  });

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  int changeCounter = 1;
  String? uid;
  Map<String, dynamic>? data;
  @override
  void initState() {
    haveUid();
    getUid();

    super.initState();
  }

  Future<String?> haveUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('uid');
  }

  void getUid() async {
    uid = await haveUid();
    setState(() {});
    print("--------------- UID ----------------------------");
    print(uid);
  }

  void saveChangeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('changeCounter', changeCounter);
    print('changeCounter: $changeCounter');
  }

  @override
  Widget build(BuildContext context) {
    print("uid passed to navbarscreen: ${uid}");
    print("secondary locatoin is : $secondaryLocation");

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.cancel_sharp)),
                ),
                Align(
                  alignment: Alignment.center,
                  // child: FutureBuilder<DocumentSnapshot>(
                  //     future: users.doc(uid).get(),
                  //     builder:
                  //         (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  //       // print(snapshot.data!.data['f_name']);
                  //       print("_____________________________");
                  //       Map<String, dynamic> data;
                  //       if (!snapshot.hasData ||
                  //           snapshot.connectionState ==
                  //               ConnectionState.waiting) {
                  //         return CircularProgressIndicator();
                  //       }
                  //       if (snapshot.hasData) {
                  //         data = snapshot.data?.data() as Map<String, dynamic>;
                  //         return Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             const SizedBox(width: 10),
                  //             Container(
                  //               height: 100,
                  //               width: 100,
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 image: DecorationImage(
                  //                   image: NetworkImage(
                  //                     data['imgUrl'],
                  //                   ),
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //               ),
                  //             ),
                  //             Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(data['f_name']),
                  //                 Text(data['nickname']),
                  //                 GestureDetector(
                  //                   onTap: () {},
                  //                   child: Text(
                  //                     'Edit',
                  //                     style: CPATextTheme().subtext.copyWith(
                  //                           color: CPAColorTheme().primaryblue,
                  //                           fontSize: 10.84,
                  //                           fontFamily: 'SF Pro Display',
                  //                           fontWeight: FontWeight.w400,
                  //                           height: 0,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         );
                  //       } else {
                  //         return Text("Some Error OCcured");
                  //       }
                  //     }),
                  child: FutureBuilder<DocumentSnapshot>(
                    future: users.doc(uid).get(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          uid == null) {
                        return CircularProgressIndicator();
                      }

                      if (!snapshot.hasData ||
                          snapshot.data == null ||
                          !snapshot.data!.exists) {
                        // Handle the case where the document does not exist or data is null
                        return Text("");
                      }

                      // Access the data using snapshot.data!.data()
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 140),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: data['imgUrl'] != null &&
                                      data['imgUrl'].isNotEmpty
                                  ? Colors
                                      .transparent // Set to transparent if there is an image
                                  : Colors
                                      .black, // Set to black if there is no image
                            ),
                            child: data['imgUrl'] != null &&
                                    data['imgUrl'].isNotEmpty
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data['imgUrl']),
                                    radius: 50,
                                  )
                                : Icon(
                                    Icons.person,
                                    color: Colors
                                        .white, // Set the color for the person icon
                                    size: 50,
                                  ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                data['f_name'].toString().toUpperCase(),
                                style: TextStyle(
                                    fontFamily: CPATextTheme().fontFamily),
                              ),
                              SizedBox(width: 10),
                              Text(data['nickname'].toString().toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: CPATextTheme().fontFamily)),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBoxes.verticalBig,
                Container(
                  height: 57,
                  width: 305,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      color: CPAColorTheme().primarygolden),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CPAColorTheme().primarygolden),
                      onPressed: () async {
                        var subscriptionManager = SubscriptionManager();

                        if (changeCounter < subscriptionManager.maxCPAChanges) {
                          // Allow the user to change the CPA report
                          print("Allowing CPA report change");
                          // Increment the counter
                          setState(() {
                            changeCounter++;
                          });

                          // Save the updated counter to shared preferences
                          saveChangeCounter();

                          // Update the counter in Firestore
                          await AuthServices.updateChangeCounter(
                              uid: widget.uid!);

                          // Navigate to the AnalysisScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnalysisScreen1(
                                uid: widget.uid,
                              ),
                            ),
                          );
                        } else {
                          // Show the subscription screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubscriptionPlanScreen(),
                            ),
                          );
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(CPAAssets.CpApplication),
                          SizedBoxes.horizontalTiny,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Change ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: CPATextTheme().fontFamily)),
                              ),
                              Text(
                                'your CPA report',
                                style: CPATextTheme()
                                    .extrasmall
                                    .copyWith(color: CPAColorTheme().white),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                SizedBoxes.verticalExtraGargangua,
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(
                          uid: uid,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(CPAAssets.EditProfile),
                      SizedBoxes.horizontalMedium,
                      Text(
                        'Edit Profile',
                        style: CPATextTheme().subtext.copyWith(
                              color: CPAColorTheme().black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: CPAColorTheme().primaryblue,
                      )
                    ],
                  ),
                ),
                SizedBoxes.verticalBig,
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(CPAAssets.ReferFriend),
                      SizedBoxes.horizontalMedium,
                      Text(
                        'Refer Friends',
                        style: CPATextTheme().subtext.copyWith(
                              color: CPAColorTheme().black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: CPAColorTheme().primaryblue,
                      )
                    ],
                  ),
                ),
                SizedBoxes.verticalBig,
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(CPAAssets.Language),
                      SizedBoxes.horizontalMedium,
                      Text(
                        'Language',
                        style: CPATextTheme().subtext.copyWith(
                              color: CPAColorTheme().black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: CPAColorTheme().primaryblue,
                      )
                    ],
                  ),
                ),
                SizedBoxes.verticalBig,
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(CPAAssets.Lock),
                      SizedBoxes.horizontalMedium,
                      Text(
                        'Privacy Policy',
                        style: CPATextTheme().subtext.copyWith(
                              color: CPAColorTheme().black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: CPAColorTheme().primaryblue,
                      )
                    ],
                  ),
                ),
                SizedBoxes.verticalExtraGargangua,
                SizedBoxes.verticalExtraGargangua,
                Image.asset(CPAAssets.CpaLogo),
                SizedBoxes.verticalBig,
                SizedBoxes.verticalBig,
                SizedBox(
                  width: 305,
                  height: 52,
                  child: CustomButton(
                    buttonText: 'Logout',
                    onPressed: () async {
                      SharedPrefencesServices prefs =
                          await SharedPrefencesServices();

                      prefs.clearPrefences();

                      await AuthServices.signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                          (route) => false);
                    },
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
