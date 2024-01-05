import 'package:cpa/UI/screens/homescreen/widgets/side_navbar/side_navbar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SideNavbar(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.43,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.92,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildPrivacyPolicyContent(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPrivacyPolicyContent() {
    return [
      _buildHeading('1. Introduction'),
      SizedBox(height: 20),
      Text(
        'Welcome to the CPA Survival App ("the App") operated by Survival Machine. By accessing or using the App, you agree to be bound by these Terms and Conditions. If you disagree with any part of these terms, please refrain from using the App.',
      ),
      SizedBox(height: 20),
      _buildHeading('2. User Eligibility and Acceptable Use'),
      SizedBox(height: 20),
      Text(
        'Users agree not to use the App for any unlawful purpose or in violation of any applicable laws, regulations, or ethical standards.',
      ),
      SizedBox(height: 20),
      _buildHeading('3. Ownership of Intellectual Property'),
      SizedBox(height: 20),
      Text(
        'The content, features, and functionality of the App are the exclusive property of Survival Machine. All intellectual property rights are protected by international copyright, trademark, patent, trade secret, and other proprietary rights laws.',
      ),
      SizedBox(height: 10),
      Text(
        'This app may contain copyrighted material that has not been specifically authorized by the copyright owner. The material is made available for the purpose of criticism, commentary, news reporting, teaching, scholarship, or research. The use of such material is protected by the Fair Use doctrine of the United States Copyright Act. If you wish to use copyrighted material from this app for purposes of your own that go beyond Fair Use, you must obtain permission from the copyright owner.',
      ),
      SizedBox(height: 20),
      _buildHeading('4. Limitation of Liability'),
      SizedBox(height: 20),
      Text(
        'Survival Machine disclaims any liability for indirect, incidental, special, consequential, or punitive damages arising out of or in connection with the use of the App.',
      ),
      SizedBox(height: 10),
      Text(
        'Users acknowledge and agree that the use of the App is at their own risk and discretion.',
      ),
      SizedBox(height: 10),
      Text(
        'Users acknowledge the Survival Machine App is for entertainment purposes only and that Users should do their own due diligence when it comes to developing a personal preparedness plan and not rely solely on the recommendations provided through the Survival Machine App and The Comprehensive Preparedness Analysis (CPA) supplied within the App.',
      ),
      SizedBox(height: 20),
      _buildHeading('5. Termination of Use'),
      SizedBox(height: 20),
      Text(
        'Survival Machine reserves the right to terminate or suspend user accounts and deny access to the App without prior notice or liability, for any reason, and at its sole discretion.',
      ),
    ];
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
