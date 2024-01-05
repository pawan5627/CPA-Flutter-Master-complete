import 'package:cpa/export.dart';

import '../../../data/dummy.dart';

class AnalysisScreen3 extends StatelessWidget {
  final String? uid;

  AnalysisScreen3({super.key, this.uid});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "One More...",
                    style: CPATextTheme().heading4,
                  ),
                ),
                SizedBoxes.verticalMicro,
                Align(
                  alignment: Alignment.topLeft,
                  child: ProgressBar(
                    value: 0.6,
                    backgroundColor: CPAColorTheme().white,
                    fillColor: CPAColorTheme().primaryblue,
                  ),
                ),
                SizedBoxes.verticalBig,
                Text(
                  'Would you consider yourself and your family proficient with basic technology i.e SmartPhones, Laptops, ipads, etc?',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                SimpleDropdown(
                  onTap: (val) {
                    basicTechnology = val;
                  },
                ),
                SizedBoxes.verticalBig,
                Text(
                  'In case of financial disruption bartering items are a great investment Are you interested in potential bartering items? If so, how much would you be willing to invest in these items to assure your family will having bartering power if the need arises.',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        height: 1,
                      ),
                ),
                //tags here
                SizedBoxes.verticalBig,
                MoneyTag(),
                SizedBoxes.verticalBig,
                Text(
                  'Are you interested in having alternative lines of communication with family members and important resources if cell phone coverage is interrupted? IF yes, how many people outside of your immediate household would you want to be outfitted with proper equipment?',
                  style: CPATextTheme().body,
                ),
                SizedBoxes.verticalBig,
                CustomTextField(
                  controller: _controller,
                  hintText: 'example...',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                  maxLines: 4,
                ),
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
                                builder: (context) => AnalysisScreen2(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: 150,
                      height: 47,
                      child: CustomButton(
                          textColor: CPAColorTheme().primaryblue,
                          buttonText: 'Next',
                          onPressed: () {
                            communication = _controller.text.toString();
                            print("-----------------------");
                            print(basicTechnology);
                            print(invest);
                            print(communication);

                            if (communication == "" ||
                                (basicTechnology == "") ||
                                (invest == "")) {
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnalysisScreen4(uid: uid),
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

class MoneyTag extends StatefulWidget {
  const MoneyTag({Key? key}) : super(key: key);

  @override
  _MoneyTagState createState() => _MoneyTagState();
}

class _MoneyTagState extends State<MoneyTag> {
  String selectedTag = '';

  void selectTag(String tag) {
    setState(() {
      selectedTag = tag;
      invest = tag;
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
            buildTag('\$500', CPAColorTheme().primaryblue),
            SizedBoxes.horizontalMicro,
            buildTag('\$1000', CPAColorTheme().primaryblue),
            SizedBoxes.horizontalMicro,
            buildTag('\$2500', CPAColorTheme().primaryblue),
            SizedBoxes.horizontalMicro,
            buildTag('\$5000', CPAColorTheme().primaryblue),
          ],
        ),
      ),
    );
  }

  Widget buildTag(String tag, Color backgroundColor) {
    bool isSelected = selectedTag == tag;
    return GestureDetector(
      onTap: () => selectTag(tag),
      child: Container(
        width: 89,
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
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
