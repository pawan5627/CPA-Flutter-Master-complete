import 'package:cpa/export.dart';

import '../../../data/dummy.dart';

class AnalysisFinalScreen extends StatelessWidget {
  const AnalysisFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/Framebg.png',
                width: MediaQuery.of(context).size.width, // Make it full-width
                height: MediaQuery.of(context).size.height *
                    0.45, // Adjust the height as needed
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(CPAAssets.CpaLogo),
                      ),
                    ],
                  ),
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  Container(
                    height: 225,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 232, 224, 224)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'CONGRATS!',
                            style: CPATextTheme().heading3.copyWith(
                                  color: CPAColorTheme().primarygolden,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                          ),
                          SizedBoxes.verticalBig,
                          Text(
                            'Create your Survival Machine Account to get the results from your CPA! After creating your account, your CPA will be housed in the app so that you can access it at any time!',
                            textAlign: TextAlign.center,
                            style: CPATextTheme().subtext.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.56,
                                  color: CPAColorTheme().neutral500,
                                ),
                          ),
                          SizedBoxes.verticalLarge,
                          SizedBox(
                            width: 244,
                            height: 39,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: CPAColorTheme()
                                    .primaryblue, // Set the button background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      4), // Set the button border radius to zero for no rounding
                                ),
                              ),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontSize: 16, // Set the button text size
                                  color:
                                      Colors.white, // Set the button text color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void printall() {
  print(alternateTransport);

  print(basicTechnology);

  print(communication);

  print(cpaLong);

  print(empdisaster);

  print(fAddress);

  print(fName);

  print(foodAllergies);

  print(getNotify);

  print(interested);

  print(invest);

  print(landSize);

  print(livingStyle);

  print(noOfAdults);

  print(noOfChildren);

  print(noOfVehicle);

  print(personalsDocuments);

  print(pets);

  print(safeRoom);

  print(secLandSize);

  print(secondaryLocation);
}
