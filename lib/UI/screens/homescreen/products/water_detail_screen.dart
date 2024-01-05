import 'package:cpa/UI/Widgets/custom_button.dart';
import 'package:cpa/constants/color_theme.dart';
import 'package:cpa/constants/text_theme.dart';
import 'package:flutter/material.dart'; 
 import 'package:url_launcher/url_launcher.dart';
import 'package:readmore/readmore.dart';

class WaterDetailScreen extends StatefulWidget {
  final Map<String, dynamic> productLink;

  WaterDetailScreen({required this.productLink});

  @override
  _WaterDetailScreenState createState() => _WaterDetailScreenState();
}

class _WaterDetailScreenState extends State<WaterDetailScreen> {
  String reviews = "Loading...";
  String description = "Loading...";

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CPAColorTheme().white,
        iconTheme: IconThemeData(
          color: CPAColorTheme().black,
        ),
        title: Text(
          widget.productLink['title'],
          style: CPATextTheme().heading6.copyWith(color: CPAColorTheme().black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                widget.productLink['image link'],
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
              Text(
                widget.productLink['title'],
                style: CPATextTheme().heading6,
              ),
              // Align(alignment: Alignment.centerLeft, child: Text('reviews')),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: ReadMoreText(
                  widget.productLink['description'],
                  trimMode: TrimMode.Line,
                  trimLines: 8,
                  moreStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              // Text('Reviews: $reviews'),
              // Text('Description: $description'),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  buttonText: 'Visit Website',
                  onPressed: () async {
                    print("clicked");
                    print(widget.productLink['product link']);
                    final Uri _url =
                        Uri.parse(widget.productLink['product link']);
                    try {
                      await launchUrl(_url);
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
