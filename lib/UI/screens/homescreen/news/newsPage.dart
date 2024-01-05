import 'package:cpa/export.dart';
import 'package:flutter/material.dart';

import 'newsDetails.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      // appBar: AppBar(
      //   backgroundColor: CPAColorTheme().white,
      //   iconTheme: IconThemeData(color: CPAColorTheme().black),
      //   title: Text(
      //     'Websites',
      //     style: CPATextTheme().heading6.copyWith(color: CPAColorTheme().black),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    'News',
                    style: CPATextTheme().heading5.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.92),
                  )
                ],
              ),
              Text(
                'Survival Machine has compiled all the best products to help you prepare for any disaster.',
                style: CPATextTheme().headline.copyWith(
                    color: CPAColorTheme().neutral400,
                    fontWeight: FontWeight.w300),
              ),
              SizedBoxes.verticalLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetails(
                                  collectionName: "Industry news",
                                )),
                      );
                    },
                    child: Container(
                      height: 179,
                      width: 150,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().primarygolden,
                        borderRadius: BorderRadius.circular(
                            1.0), // Adjust the value to change the corner radius
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.Website),
                          Text(
                            'Industry',
                            textAlign: TextAlign.center,
                            style: CPATextTheme().body.copyWith(
                                color: CPAColorTheme().white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.63),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetails(
                            collectionName: "Disaster news",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 179,
                      width: 150,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().white,
                        borderRadius: BorderRadius.circular(1.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            CPAAssets.Off_Grid,
                            height: 53,
                            width: 53,
                          ),
                          Text(
                            'Disaster',
                            style: CPATextTheme().body.copyWith(
                                  color: CPAColorTheme().black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBoxes.verticalLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetails(
                                  collectionName: "Survival News",
                                )),
                      );
                    },
                    child: Container(
                      height: 179,
                      width: 150,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().white,
                        borderRadius: BorderRadius.circular(1.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            CPAAssets.nonlethal,
                            height: 53,
                            width: 53,
                          ),
                          Text(
                            'Survival',
                            style: CPATextTheme().body.copyWith(
                                color: CPAColorTheme().black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.63),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetails(
                                  collectionName: "Climate Change News",
                                )),
                      );
                    },
                    child: Container(
                      height: 179,
                      width: 150,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().white,
                        borderRadius: BorderRadius.circular(1.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.Offline),
                          Text(
                            'Climate\n Change ',
                            textAlign: TextAlign.center,
                            style: CPATextTheme().body.copyWith(
                                color: CPAColorTheme().black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.63),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBoxes.verticalLarge,
            ],
          ),
        ),
      ),
    );
  }
}
