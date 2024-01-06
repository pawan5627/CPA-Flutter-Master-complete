import 'package:cpa/UI/screens/Analysis/analysis_page1.dart';
import 'package:cpa/UI/screens/Analysis/widgets/drop_down_widget.dart';

import 'package:cpa/export.dart';

import '../../../data/dummy.dart';

// ignore: must_be_immutable
class AnalysisScreen2 extends StatelessWidget {
  final String? uid;

  AnalysisScreen2({super.key, this.uid});

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  //  TextEditingController _controller4 = TextEditingController();
  String _controller4 = '';
  String _controller5 = '1';

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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "One More...",
                    style: CPATextTheme().heading4,
                  ),
                ),
                SizedBoxes.verticalMicro,
                Align(
                  alignment: Alignment.topLeft,
                  child: ProgressBar(
                    value: 0.4,
                    backgroundColor: CPAColorTheme().white,
                    fillColor: CPAColorTheme().primaryblue,
                  ),
                ),
                SizedBoxes.verticalMedium,
                Text(
                  'How many family pets i.e domestic animals (Dogs and Cats) would you like your CPA to account for?',
                  style: CPATextTheme().body.copyWith(fontSize: 14, height: 1),
                ),
                SizedBoxes.verticalBig,
                CustomTextField(
                  controller: _controller1,
                  hintText: '1 Dog, 2 Cat...',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalBig,
                Text(
                  'Do you ive in a single-family home with a slab or do you live in an appartment not on the lowest level?',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                // CustomTextField(
                //   controller: _controller2,
                //   hintText: 'example...',
                //   hintStyle: CPATextTheme()
                //       .subtext
                //       .copyWith(color: CPAColorTheme().neutral400),
                // ),

                ReusableDropDown(
                  onTap: (value) {
                    _controller4 = value;
                  },
                  items: ['single family home', 'Apartment'],
                ),
                SizedBoxes.verticalBig,
                Text(
                  'If in a single-family home, do you have more ot less than 1/2 acre of land?',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                CustomTextField(
                  controller: _controller3,
                  hintText: 'example...',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalBig,
                Text(
                  'How many vehicles would you like to have prepared within your CPA?',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,

                ReusableDropDown(
                  onTap: (value) {
                    _controller5 = value;
                  },
                  items: ['1', '2', '3', '4'],
                ),

                SizedBoxes.verticalBig,
                Text(
                  'Are you interested in your analysis taking into \nconsideration personal non-lethal protection for you and your family? ',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                SimpleDropdown(
                  onTap: (value) {
                    interested = value;
                  },
                ),
                SizedBoxes.verticalBig,
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
                                builder: (context) => AnalysisScreen1(),
                              ),
                            );
                          }),
                    ),
                    // SizedBoxes.horizontalBig,
                    SizedBox(
                      width: 150,
                      height: 47,
                      child: CustomButton(
                          textColor: CPAColorTheme().primaryblue,
                          buttonText: 'Next',
                          onPressed: () {
                            pets = _controller1.text.toString();
                            livingStyle =
                                _controller4; // Uncomment if _controller2 is needed
                            landSize = _controller3.text.toString();

                            noOfVehicle = _controller5;

                            print("_______________________________");
                            print('pets is $pets');
                            print(
                                'livingStyle is $livingStyle'); // Make sure _controller2 is uncommented if needed
                            print('landSize is $landSize');
                            print('noOfVehicle is $noOfVehicle');
                            print('interested is $interested');

                            // Validate fields before proceeding
                            if ((livingStyle == " ") ||
                                (noOfVehicle == "") ||
                                (interested == "")) {
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
                              // All fields are filled, proceed to the next screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnalysisScreen3(uid: uid),
                                ),
                              );
                            }
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
