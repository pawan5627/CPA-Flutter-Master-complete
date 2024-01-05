import 'package:cpa/UI/Widgets/progress_bar.dart';
import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';

import '../../../services/auth_services.dart';

class AnalysisScreen5 extends StatelessWidget {
  final String? uid;

  const AnalysisScreen5({super.key, this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  CPAAssets.CpaLogo,
                  width: 90, // Set the desired width
                  height: 70, // Set the desired height
                ),
              ),
              SizedBoxes.verticalBig,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "And we are done....",
                  style: CPATextTheme().heading4,
                ),
              ),
              SizedBoxes.verticalMicro,
              Align(
                alignment: Alignment.topLeft,
                child: ProgressBar(
                  value: 1,
                  backgroundColor: CPAColorTheme().white,
                  fillColor: CPAColorTheme().primaryblue,
                ),
              ),
              SizedBoxes.verticalBig,
              Text(
                'Do you want to consider alternate transportation in case of disruption to traditional roadways?',
                style: CPATextTheme().body,
              ),
              SizedBoxes.verticalBig,
              SimpleDropdown(
                onTap: (val) {
                  alternateTransport = val;
                },
              ),
              SizedBoxes.verticalBig,
              Text(
                'Do you want your CPA to provide suggestions for radiological or EMP disasters?',
                style: CPATextTheme().body,
              ),
              SizedBoxes.verticalBig,
              SimpleDropdown(
                onTap: (val) {
                  empdisaster = val;
                },
              ),
              SizedBoxes.verticalBig,
              Text(
                'Are you interested in receiving select notices through your app such as new product reviews, important news updates and advances in technology?',
                style: CPATextTheme().body,
              ),
              SizedBoxes.verticalBig,
              SimpleDropdown(
                onTap: (val) {
                  getNotify = val;
                },
              ),
              SizedBoxes.verticalBig,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 47,
                    child: CustomButton(
                        isActive: true,
                        isOutlined: true,
                        color: CPAColorTheme().primaryblue,
                        textColor: CPAColorTheme().primaryblue,
                        buttonText: 'Back',
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnalysisScreen4(),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    width: 150,
                    height: 47,
                    child: CustomButton(
                      textColor: CPAColorTheme().primaryblue,
                      buttonText: 'All Done',
                      onPressed: () async {
                        print("____________________________");
                        print(alternateTransport);
                        print(empdisaster);
                        print(getNotify);

                        if ((alternateTransport == null) ||
                            (empdisaster == null) ||
                            (getNotify == null)) {
                          // Show an alert if any of the required fields is empty
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Incomplete Information'),
                              content: Text(
                                  'Please fill in all the required fields.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          try {
                            if (uid != null) {
                              print("uid of current user is : $uid");

                              // Update user details in Firebase
                              await AuthServices.updateCPADetails(
                                uid: uid!,
                              );

                              print(
                                  "CPA details updated. Navigating to HomeScreen");

                              // User is logged in, navigate to HomeScreen
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(uid: uid),
                                ),
                                (route) => false,
                              );
                            } else {
                              // User is not logged in, navigate to AnalysisFinalScreen

                              print("Navigating to AnalysisFinalScreen");
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnalysisFinalScreen(),
                                ),
                                (route) => false,
                              );
                            }
                          } catch (error) {
                            print(
                                "Error updating CPA details or navigating: $error");
                            // Handle the error as needed
                          }
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
