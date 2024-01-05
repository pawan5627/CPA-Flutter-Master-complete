// ignore_for_file: unused_import

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/UI/screens/homescreen/widgets/recommmendation2.dart';
import 'package:flutter/material.dart';
import '../../../constants/assets.dart';
import '../../../constants/color_theme.dart';
import '../../../constants/sizedboxes.dart';
import '../../../constants/text_theme.dart';
import 'package:cpa/UI/screens/pdf_screen.dart/pdf_analyze.dart'; // Import the PdfAnalyzeApi class
import 'package:cpa/data/analyze_data.dart';
import 'package:open_file/open_file.dart';

import '../pdf_screen.dart/pdf_screen.dart';

class CPA_Screen extends StatefulWidget {
  final String? uid;
  const CPA_Screen({super.key, required this.uid});

  @override
  State<CPA_Screen> createState() => _CPA_ScreenState();
}

Future<void> generateAndShowPDF(
    BuildContext context, AnalyzeData analyzeData) async {
  try {
    // Generate the PDF using your PdfAnalyzeApi
    File pdfFile = await PdfAnalyzeApi.generate(analyzeData);

    // Check if the PDF file is created successfully
    if (pdfFile.existsSync()) {
      print('PDF generated successfully: ${pdfFile.path}');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfScreen(),
        ),
      );

      // Add a delay before opening the file
      await Future.delayed(Duration(seconds: 1));

      // Open the PDF using the open_file package
      await OpenFile.open(pdfFile.path);
    } else {
      print('PDF generation failed.');
      // Handle the failure accordingly
    }
  } catch (e) {
    print('Error generating or displaying PDF: $e');
    // Handle error accordingly
  }
}

String noOfAdults = "";
String noOfChildren = "";
String pets = "";
String home = "";
String geographic = "";
String secondaryLocation = "";
String noOfVehicle = "";
String cpa_long = "";
String alternate_transport = "";
String non = "";
String handing = "";
String invest = "";
String basicTechnology = "";

class _CPA_ScreenState extends State<CPA_Screen> {
  @override
  void initState() {
    super.initState();
    print("uid passed to CPA_Screen: ${widget.uid}");
    fetchUserDetails(widget.uid);
  }

  Future<void> fetchUserDetails(String? userId) async {
    try {
      // Get a reference to the user's document in Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      // Check if the document exists
      if (userSnapshot.exists) {
        // Access the data from the document snapshot
        Map<String, dynamic>? userData =
            userSnapshot.data() as Map<String, dynamic>?;

        if (userData != null) {
          // Update the state with the fetched details
          // Update the state with the fetched details
          setState(() {
            // Convert integer fields to String using toString()
            noOfAdults = (userData['no_of_adults'] ?? 0).toString();
            noOfChildren = (userData['no_of_children'] ?? 0).toString();
            pets = (userData['pets'] ?? '').toString();
            home = (userData['living_style'] ?? '').toString();
            geographic = (userData['sec_land_size'] ?? '').toString();
            secondaryLocation =
                (userData['secondary_location'] ?? '').toString();
            noOfVehicle = (userData['no_of_vehicle'] ?? 0).toString();
            cpa_long = (userData['cpa_long'] ?? '').toString();
            alternate_transport =
                (userData['alternate_transport'] ?? '').toString();
            non = (userData['non'] ?? '').toString();
            handing = (userData['safe_room'] ?? '').toString();
            invest = (userData['invest'] ?? '').toString();
            basicTechnology = (userData['basic_technology'] ?? '').toString();
          });

          // Print the fetched details
          print('Fetched Details:');
          print('No. of Adults: $noOfAdults');
          print('No. of Children: $noOfChildren');
          print('Pets: $pets');
          print('Home: $home');
          print('Geographic: $geographic');
          print('Secondary Location: $secondaryLocation');
          print('No. of Vehicles: $noOfVehicle');
          print('CPA Long: $cpa_long');
          print('Alternate Transport: $alternate_transport');
          print('Non: $non');
          print('Handling On: $handing');
          print('Invest: $invest');
          print('Basic Technology: $basicTechnology');
        } else {
          print('User data is null.');
        }
      } else {
        print('User document does not exist.');
      }
    } catch (e) {
      print('Error fetching user details: $e');
      // Handle error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                  child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
                      Text(
                        'CPA',
                        style: CPATextTheme().heading5.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.92),
                      )
                    ],
                  ),
                  SizedBoxes.verticalLarge,
                  Container(
                    height: 70,
                    width: double.infinity,
                    color: Color.fromARGB(255, 198, 188, 188),
                    child: Center(
                      child: Text(
                        'Survival Machine is excited to present to you your very own personalized Comprehensive Preparedness Analysis. (CPA) We are confident this CPA will help streamline your decision making processes when it come to protecting your families safety and wellbeing',
                        style: CPATextTheme().small.copyWith(
                            color: CPAColorTheme().neutral600,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBoxes.verticalLarge,
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: CPAColorTheme().primarygolden,
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.water),
                                  SizedBoxes.horizontalMedium,
                                  Column(
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        'People',
                                        style: CPATextTheme().heading6.copyWith(
                                            color: CPAColorTheme().white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        noOfAdults +
                                            ' Adults, ' +
                                            noOfChildren +
                                            ' Children',
                                        style: CPATextTheme().small.copyWith(
                                            color: CPAColorTheme().white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CPAColorTheme().white,
                                borderRadius: BorderRadius.circular(1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.power),
                                  SizedBox(
                                      width: 8), // Adjust the width as needed
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Set this property
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        'Pets',
                                        style: CPATextTheme().heading6.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        pets,
                                        style: CPATextTheme().small.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBoxes.verticalLarge,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CPAColorTheme().white,
                                borderRadius: BorderRadius.circular(1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.power),
                                  SizedBox(
                                      width: 8), // Adjust the width as needed
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Set this property
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        'Home Type',
                                        style: CPATextTheme().heading6.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        home,
                                        style: CPATextTheme().small.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CPAColorTheme().white,
                                borderRadius: BorderRadius.circular(1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.power),
                                  SizedBox(
                                      width: 8), // Adjust the width as needed
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Set this property
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        'Geographic',
                                        style: CPATextTheme().heading6.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        geographic,
                                        style: CPATextTheme().small.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBoxes.verticalLarge,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CPAColorTheme().white,
                                borderRadius: BorderRadius.circular(1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.power),
                                  SizedBox(
                                      width: 8), // Adjust the width as needed
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Set this property
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        '2nd Location',
                                        style: CPATextTheme().heading6.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        secondaryLocation,
                                        style: CPATextTheme().small.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CPAColorTheme().white,
                                borderRadius: BorderRadius.circular(1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.power),
                                  SizedBox(
                                      width: 8), // Adjust the width as needed
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Set this property
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        'Duration    ',
                                        style: CPATextTheme().heading6.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        cpa_long,
                                        style: CPATextTheme().small.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBoxes.verticalLarge,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CPAColorTheme().white,
                                borderRadius: BorderRadius.circular(1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.power),
                                  SizedBox(
                                      width: 8), // Adjust the width as needed
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Set this property
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        'Vehicle        ',
                                        style: CPATextTheme().heading6.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        alternate_transport,
                                        style: CPATextTheme().small.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CPAColorTheme().white,
                                borderRadius: BorderRadius.circular(1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 90,
                              width: 190,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.power),
                                  SizedBox(
                                      width: 8), // Adjust the width as needed
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Set this property
                                    children: [
                                      SizedBoxes.verticalMedium,
                                      SizedBoxes.verticalMedium,
                                      Text(
                                        'Non-Lethal',
                                        style: CPATextTheme().heading6.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        'Yes',
                                        style: CPATextTheme().small.copyWith(
                                              color: CPAColorTheme().black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBoxes.verticalLarge,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: CPAColorTheme().white,
                                  borderRadius: BorderRadius.circular(1.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 90,
                                width: 190,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(CPAAssets.power),
                                    SizedBox(
                                        width: 8), // Adjust the width as needed
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Set this property
                                      children: [
                                        SizedBoxes.verticalMedium,
                                        SizedBoxes.verticalMedium,
                                        Text(
                                          'Handling On',
                                          style: CPATextTheme()
                                              .heading6
                                              .copyWith(
                                                color: CPAColorTheme().black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          'Vaitaki Radio',
                                          style: CPATextTheme().small.copyWith(
                                                color: CPAColorTheme().black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: CPAColorTheme().white,
                                  borderRadius: BorderRadius.circular(1.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 90,
                                width: 190,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(CPAAssets.power),
                                    SizedBox(
                                        width: 8), // Adjust the width as needed
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Set this property
                                      children: [
                                        SizedBoxes.verticalMedium,
                                        SizedBoxes.verticalMedium,
                                        Text(
                                          '\$ Budget',
                                          style: CPATextTheme()
                                              .heading6
                                              .copyWith(
                                                color: CPAColorTheme().black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          invest,
                                          style: CPATextTheme().small.copyWith(
                                                color: CPAColorTheme().black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                        SizedBoxes.verticalLarge,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: CPAColorTheme().white,
                                  borderRadius: BorderRadius.circular(1.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 90,
                                width: 190,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(CPAAssets.power),
                                    SizedBox(
                                        width: 8), // Adjust the width as needed
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Set this property
                                      children: [
                                        SizedBoxes.verticalMedium,
                                        SizedBoxes.verticalMedium,
                                        Text(
                                          'Technology',
                                          style: CPATextTheme()
                                              .heading6
                                              .copyWith(
                                                color: CPAColorTheme().black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          basicTechnology,
                                          style: CPATextTheme().small.copyWith(
                                                color: CPAColorTheme().black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AnalyzeData analyzeData = AnalyzeData(
                                    alternateTransport: geographic,
                                    basicTechnology: geographic,
                                    communication: geographic,
                                    cpaLong: geographic,
                                    empdisaster: geographic,
                                    fAddress: geographic,
                                    fName: "",
                                    foodAllergies: geographic,
                                    getNotify: geographic,
                                    interested: geographic,
                                    invest: geographic,
                                    landSize: geographic,
                                    livingStyle: geographic,
                                    noOfAdults: geographic,
                                    noOfChildren: geographic,
                                    noOfVehicle: geographic,
                                    personalsDocuments: geographic,
                                    pets: geographic,
                                    safeRoom: geographic,
                                    secLandSize: geographic,
                                    secondaryLocation: geographic,
                                  ); // Replace this with your actual data

                                  generateAndShowPDF(context, analyzeData);
                                },
                                child: Container(
                                  height: 90,
                                  color: Colors.red,
                                  width: 190,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(CPAAssets.power),
                                      SizedBox(
                                          width:
                                              8), // Adjust the width as needed
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Set this property
                                        children: [
                                          SizedBoxes.verticalMedium,
                                          SizedBoxes.verticalMedium,
                                          Text(
                                            'View CPA',
                                            style: CPATextTheme()
                                                .heading6
                                                .copyWith(
                                                  color: CPAColorTheme().white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Text(
                                            'Download ',
                                            style: CPATextTheme()
                                                .small
                                                .copyWith(
                                                  color: CPAColorTheme().white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                      ]))
                ],
              )),
              // Recomendation(collectionName: 'recomendation', uid: widget.uid)
            ],
          ),
        ),
      ),
    );
  }
}
