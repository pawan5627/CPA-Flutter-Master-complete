import 'package:flutter/material.dart';
import 'package:cpa/export.dart';
 
class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  // Selected subscription plan
  int selectedPlan = 1; // Defaulting to the first plan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(CPAAssets.CpaLogo),
                SizedBoxes.verticalExtraGargangua,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Check out our subscription plans',
                    textAlign: TextAlign.left,
                    style: CPATextTheme().heading1.copyWith(
                        color: CPAColorTheme().primarygolden,
                        fontSize: 39,
                        fontWeight: FontWeight.w600,
                        height: 0),
                  ),
                ),
                SizedBoxes.verticalLarge,
                buildSubscriptionPlanTile(1, 'Basic Plan', 'Free', 8),
                buildSubscriptionPlanTile(
                    2, 'Standard Plan', '\$8.00/month', 16),
                buildSubscriptionPlanTile(
                    3, 'Premium Plan', '\$16.00/month', 24),
                SizedBoxes.verticalLarge,
                SizedBoxes.verticalLarge,
                SizedBoxes.verticalLarge,
                SizedBoxes.verticalLarge,
                CustomButton(
                  buttonText: 'Subscribe',
                  onPressed: () {
                    var subscriptionManager = SubscriptionManager();

                    switch (selectedPlan) {
                      case 1:
                        // Handle Basic Plan subscription logic
                        break;
                      case 2:
                        // Handle Standard Plan subscription logic
                        subscriptionManager.updateMaxCPAChanges(8);
                        break;
                      case 3:
                        // Handle Premium Plan subscription logic
                        subscriptionManager.updateMaxCPAChanges(24);
                        break;
                    }

                    // Continue with any other logic you have for subscription or navigation
                    // initiateGooglePay();
                  },
                  color: Colors.red, // or your desired button color
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubscriptionPlanTile(
      int value, String title, String price, int numberOfCPA) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: CPAColorTheme().neutral200,
          width: 2.0,
        ),
      ),
      child: RadioListTile(
        title: RichText(
          text: TextSpan(
            text: '$title ',
            style: CPATextTheme().body.copyWith(
                  color: CPAColorTheme().black,
                  fontSize: 18,
                ),
            children: [
              TextSpan(
                text: '$numberOfCPA cpa/mo',
                style: TextStyle(
                  color: CPAColorTheme().primarygolden,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          price,
          style: CPATextTheme().body.copyWith(
                color: CPAColorTheme().neutral400,
                fontSize: 16,
              ),
        ),
        value: value,
        groupValue: selectedPlan,
        onChanged: (int? value) {
          setState(() {
            selectedPlan = value!;
          });
        },
      ),
    );
  }

  // Future<void> initiateGooglePay() async {
  //   try {
  //     await  GooglePay.showGooglePaySheet(
  //       price: '8.00', // Replace with the selected subscription plan price
  //       currencyCode: 'USD',
  //       name: 'Subscription',
  //       paymentItems: [
  //         PaymentItem(
  //           label: 'Subscription',
  //           amount: '8.00',
  //         ),
  //       ],
  //       onPaymentResult: (data) {
  //         // Handle the payment result
  //         print(data);
  //       },
  //       onError: (error) {
  //         // Handle errors
  //         print(error);
  //       },
  //     );
  //   } catch (e) {
  //     // Handle exceptions
  //     print(e);
  //   }
  // }
}

class SubscriptionManager {
  int _maxCPAChanges = 8;

  int get maxCPAChanges => _maxCPAChanges;

  void updateMaxCPAChanges(int newMaxChanges) {
    _maxCPAChanges = newMaxChanges;
  }

  // Singleton instance
  static final SubscriptionManager _instance = SubscriptionManager._internal();

  factory SubscriptionManager() {
    return _instance;
  }

  SubscriptionManager._internal();
}
