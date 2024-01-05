import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  bool loading = false;

  String? uid;

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

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var date = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(uid).get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                Map<String, dynamic> data;
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  data = snapshot.data?.data() as Map<String, dynamic>;

                  // Check the data types before using them
                  String name =
                      data['f_name'] ?? ''; // Provide default value if null
                  String email = data['email'] ?? '';
                  String phoneNumber =
                      data['number']?.toString() ?? ''; // Convert to String
                  String address = data['f_address'] ?? '';
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Date: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text:
                                      "${date.day}-${date.month}-${date.year}",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Logo Brand
                      SizedBox(height: 40),
                      Image.asset("assets/images/cpalogo.png"),
                      SizedBox(height: 5),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: "Comprehensive Preparedness Analysis (CPA)",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                          width: 200,
                          child: Divider(color: Colors.yellow, thickness: 3)),
                      // Name Section
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Name Email Phone
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name:"),
                              Text(data['f_name'] ?? 'N/A'),
                              Text("Email:"),
                              Text(data['email'] ?? 'N/A'),
                              Text("Phone no:"),
                              Text(data['number']?.toString() ?? 'N/A'),
                            ],
                          ),

                          // Location
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Location"),
                              Text(data['f_address']),
                            ],
                          ),
                        ],
                      ),
                      // Intro Paragraph
                      SizedBox(height: 20),
                      Text(
                        lorem(paragraphs: 1, words: 60),
                        textAlign: TextAlign.justify,
                      ),
                      // Our Recommendation
                      // Intro Paragraph
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Our Recommendation's",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[800],
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Kit You Need to Survive (60 Days)",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      SizedBox(height: 10),
                      QuestionWidget(),
                      // Determine
                      SizedBox(height: 20),
                      Text(
                        "This will determine the type of water containers we suggest",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(lorem(paragraphs: 3, words: 150)),
                      // Informative Website for Training and Survival
                      SizedBox(height: 20),
                      Text(
                        "Informative websites for Training & Survival",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "by survival machine",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 10),
                      NewsColumn(),
                      SizedBox(height: 10),
                      NewsColumn(),
                      SizedBox(height: 10),
                      NewsColumn(),
                      SizedBox(height: 10),
                      NewsColumn(),
                      SizedBox(height: 10),
                      NewsColumn(),
                      SizedBox(height: 10),
                      NewsColumn(),
                      SizedBox(height: 20),
                      Text(lorem(paragraphs: 1, words: 30)),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "John Bolton",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 10),
                              Text("Founder"),
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                } else {
                  return Center(child: Text("Some Error OCcured"));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NewsColumn extends StatelessWidget {
  const NewsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Non-GMO, Heirloom, Open-Pollinated Seeds & Seed Vaults",
          style: TextStyle(fontSize: 18, color: Colors.amber),
        ),
        SizedBox(height: 10),
        Text(
          "100% Non-GMO, 100% Heirloom Survival Seeds. Grow an Emergency Vegetable Garden, Herb Garden and more with our Survival Grade Seeds. Discounts on Seed Vault Packages. Off The Grid News",
        ),
        SizedBox(height: 5),
        Text(
          "Off The Grid News/",
          style: TextStyle(color: Colors.blue[900], fontSize: 12),
        ),
      ],
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.food_bank),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Food Resources (3-5 Persons)",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
        Text(
          lorem(paragraphs: 1, words: 20),
        ),
      ],
    );
  }
}
