import 'package:cpa/UI/screens/Analysis/widgets/drop_down_widget.dart';
import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';

class AnalysisScreen1 extends StatefulWidget {
  final String? uid;

  const AnalysisScreen1({Key? key, this.uid}) : super(key: key);

  @override
  _AnalysisScreen1State createState() => _AnalysisScreen1State();
}

class _AnalysisScreen1State extends State<AnalysisScreen1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _foodAllergiesController = 'No';

  double noOfAdults = 0;
  double noOfChildren = 0;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    String _foodAllergiesController = 'No';

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    CPAAssets.CpaLogo,
                    width: 90,
                    height: 70,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Let's Start...",
                    style: CPATextTheme().heading4,
                  ),
                ),
                SizedBoxes.verticalTiny,
                Align(
                  alignment: Alignment.topLeft,
                  child: ProgressBar(
                    value: 0.2,
                    backgroundColor: CPAColorTheme().white,
                    fillColor: CPAColorTheme().primaryblue,
                  ),
                ),
                SizedBoxes.verticalMedium,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Basic Info',
                    style: CPATextTheme().body,
                  ),
                ),
                SizedBoxes.verticalLarge,
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Full Name',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalLarge,
                CustomTextField(
                  controller: _addressController,
                  hintText: 'Full Address',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalLarge,
                Text(
                  'How long do you want your Comprehensive Preparedness Analysis (CPA) to cover?',
                  style: TextStyle(fontFamily: CPATextTheme().body.fontFamily),
                ),
                SizedBoxes.verticalLarge,
                const DaysTag(),
                SizedBoxes.verticalLarge,
                Row(
                  children: [
                    Text(
                      'How many Adults (1-8)',
                      style: TextStyle(
                        fontFamily: CPATextTheme().body.fontFamily,
                      ),
                    ),
                    Text(
                      '(Over the age of 12)',
                      style: TextStyle(
                        fontFamily: CPATextTheme().body.fontFamily,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBoxes.verticalLarge,
                AdultsTag(
                  onAdultsChanged: (int adultsCount) {
                    setState(() {
                      noOfAdults = adultsCount.toDouble();
                      noOfChildren = calculateMaxChildren();
                    });
                  },
                ),
                SizedBoxes.verticalLarge,
                Row(
                  children: [
                    Text(
                      'How many children ',
                      style: TextStyle(
                        fontFamily: CPATextTheme().body.fontFamily,
                      ),
                    ),
                    Text(
                      '(12 years of age or younger)',
                      style: TextStyle(
                        fontFamily: CPATextTheme().body.fontFamily,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBoxes.verticalTiny,
                SizedBoxes.verticalLarge,
                ChildrenTag(),
                SizedBoxes.verticalLarge,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Are there any food allergies? ',
                    style: TextStyle(
                      fontFamily: CPATextTheme().body.fontFamily,
                    ),
                  ),
                ),
                SizedBoxes.verticalLarge,
                ReusableDropDown(
                  onTap: (value) {
                    _foodAllergiesController = value;
                  },
                  items: ['Yes', 'No'],
                ),
                SizedBoxes.verticalLarge,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    buttonText: 'Next',
                    onPressed: () {
                      fName = _nameController.text.toString();
                      fAddress = _addressController.text.toString();
                      foodAllergies = _foodAllergiesController;

                      print('___________________________________');
                      print(fName);
                      print(fAddress);
                      print('Food Allergies: $foodAllergies');
                      print('CPA Duration: $cpaLong');
                      print('Number of Adults: $noOfAdults');
                      print('Number of Children: $noOfChildren ');

                      if (_nameController.text.isEmpty ||
                          _addressController.text.isEmpty ||
                          (cpaLong?.isEmpty ?? true) ||
                          (noOfAdults == null || noOfAdults == 0) ||
                          (noOfChildren == null || noOfChildren == 0) ||
                          (foodAllergies?.isEmpty ?? true)) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Incomplete Information'),
                            content: Text('Please fill in all the required fields.'),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnalysisScreen2(uid: uid),
                          ),
                        );
                      }
                    },
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

class DaysTag extends StatefulWidget {
  const DaysTag({Key? key});

  @override
  _DaysTagState createState() => _DaysTagState();
}

class _DaysTagState extends State<DaysTag> {
  String selectedTag = '';

  void selectTag(String tag) {
    setState(() {
      selectedTag = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTag(
              '30 days',
              CPAColorTheme().primaryblue,
              onTap: () {
                cpaLong = '30 days';
              },
            ),
            SizedBox(
              width: 13,
            ),
            buildTag(
              '60 days',
              CPAColorTheme().primaryblue,
              onTap: () {
                cpaLong = '60 days';
              },
            ),
            SizedBox(
              width: 13,
            ),
            buildTag(
              '90 days',
              CPAColorTheme().primaryblue,
              onTap: () {
                cpaLong = '90 days';
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTag(String tag, Color backgroundColor,
      {required Function()? onTap}) {
    bool isSelected = selectedTag == tag;
    return GestureDetector(
      onTap: () {
        selectTag(tag);
        onTap!();
      },
      child: Container(
        width: 105,
        height: 40.5,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.white,
          border: Border.all(
            color: CPAColorTheme().primaryblue,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: isSelected ? Colors.white : CPAColorTheme().primaryblue,
          ),
        ),
      ),
    );
  }
}

double noOfAdults = 0;
double noOfChildren = 0;

class AdultsTag extends StatefulWidget {
  final Function(int) onAdultsChanged;

  const AdultsTag({Key? key, required this.onAdultsChanged}) : super(key: key);

  @override
  _AdultsTagState createState() => _AdultsTagState();
}

class _AdultsTagState extends State<AdultsTag> {
  String selectedTag = '';

  void selectTag(String tag) {
    setState(() {
      selectedTag = tag;
      noOfAdults = double.parse(tag);
      widget.onAdultsChanged(noOfAdults.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(8, (index) {
            return buildTag((index + 1).toString(), CPAColorTheme().primaryblue);
          }),
        ),
      ),
    );
  }

  Widget buildTag(String tag, Color backgroundColor) {
    bool isSelected = selectedTag == tag;
    return GestureDetector(
      onTap: () => selectTag(tag),
      child: Container(
        width: 58,
        height: 37,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.white,
          border: Border.all(
            color: CPAColorTheme().primaryblue,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            tag.padLeft(2, '0'),
            style: TextStyle(
              color: isSelected ? Colors.white : CPAColorTheme().primaryblue,
            ),
          ),
        ),
      ),
    );
  }
}

class ChildrenTag extends StatefulWidget {
  const ChildrenTag({Key? key}) : super(key: key);

  @override
  _ChildrenTagState createState() => _ChildrenTagState();
}

class _ChildrenTagState extends State<ChildrenTag> {
  String selectedTag = '';

  void selectTag(String tag) {
    setState(() {
      selectedTag = tag;
      noOfChildren = double.parse(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    double remainingSlots = 8 - noOfAdults;

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(remainingSlots.toInt(), (index) {
            String tag = (index + 1).toString();
            bool isSelected = selectedTag == tag && noOfAdults > 0 && noOfAdults < 8;
            return buildTag(tag, isSelected, CPAColorTheme().primaryblue);
          }),
        ),
      ),
    );
  }

  Widget buildTag(String tag, bool isSelected, Color backgroundColor) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        if (isSelected) {
          selectedTag = '';
          noOfChildren = 0;
        } else {
          selectTag(tag);
        }
      },
      child: Container(
        width: 58,
        height: 37,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.white,
          border: Border.all(
            color: CPAColorTheme().primaryblue,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            tag.padLeft(2, '0'),
            style: TextStyle(
              color: isSelected ? Colors.white : CPAColorTheme().primaryblue,
            ),
          ),
        ),
      ),
    );
  }
}
 double calculateMaxChildren() {
    return 8 - noOfAdults;
  }