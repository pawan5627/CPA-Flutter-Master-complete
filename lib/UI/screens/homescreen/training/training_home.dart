import 'package:cpa/export.dart';
import 'package:flutter/material.dart';

import '../../../../data/dummy.dart';
import 'TrainingProducts.dart';

class TrainingHome extends StatelessWidget {
  const TrainingHome({super.key});

  @override
  Widget build(BuildContext context) {
    print('no of vehicle is $noOfVehicle');

    return Scaffold(
      backgroundColor: Colors.white,
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
                    'Training',
                    style: CPATextTheme().heading5.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Open Sans',
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
                            builder: (context) => TrainingProducts(
                                  collectionName: "Podcast",
                                )),
                      );
                    },
                    child: Container(
                      height: 179,
                      width: 150,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().primarygolden,
                        borderRadius: BorderRadius.circular(
                            4.0), // Adjust the value to change the corner radius
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.Podcast),
                          Text(
                            'Podcast',
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
                            builder: (context) => TrainingProducts(
                                  collectionName: "Books",
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
                            CPAAssets.Books,
                            height: 53,
                            width: 53,
                          ),
                          Text(
                            'Books',
                            style: CPATextTheme().body.copyWith(
                                color: CPAColorTheme().black,
                                fontWeight: FontWeight.w500),
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
                            builder: (context) => TrainingProducts(
                                  collectionName: "Training Courses",
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
                          Image.asset(CPAAssets.Courses),
                          Text(
                            'Training \nCourses',
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
                            builder: (context) => TrainingProducts(
                                  collectionName: "Blogs",
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
                          Image.asset(CPAAssets.Blogs),
                          Text(
                            'Blogs',
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
            ],
          ),
        ),
      ),
    );
  }
}
