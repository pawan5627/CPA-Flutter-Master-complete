import 'package:cpa/UI/screens/homescreen/products/water_resources.dart';
import 'package:cpa/export.dart';
import 'package:flutter/material.dart';

class ProductsHome extends StatelessWidget {
  const ProductsHome({super.key});

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
                  'Products',
                  style: CPATextTheme().heading5.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Open Sans',
                      letterSpacing: 0.92),
                )
              ],
            ),
            Text(
              'Survival Machine has compiled all the best products to help you prepare for any disaster',
              style: CPATextTheme().body1.copyWith(
                  color: CPAColorTheme().neutral700,
                  fontWeight: FontWeight.w300),
            ),
            SizedBoxes.verticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaterResource(
                          collectionName: "Data",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 118,
                    width: 110,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().primarygolden,
                      borderRadius: BorderRadius.circular(6.0),
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
                        Image.asset(CPAAssets.water),
                        SizedBoxes.verticalMicro,
                        Text(
                          'Water',
                          style: CPATextTheme().small.copyWith(
                              color: CPAColorTheme().white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Resources',
                          style: CPATextTheme().small.copyWith(
                              color: CPAColorTheme().white,
                              fontWeight: FontWeight.w600),
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
                        builder: (context) => WaterResource(
                          collectionName: "energy resources",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 118,
                    width: 110,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().white,
                      borderRadius: BorderRadius.circular(6.0),
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
                        Image.asset(CPAAssets.power),
                        Text(
                          'energy',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
                        ),
                        Text(
                          'Resources',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
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
                        builder: (context) => WaterResource(
                          collectionName: "emergency kits",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 118,
                    width: 110,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().white,
                      borderRadius: BorderRadius.circular(6.0),
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
                        Image.asset(CPAAssets.emergency),
                        Text(
                          'Emergency',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
                        ),
                        Text(
                          'Kits',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBoxes.verticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaterResource(
                          collectionName: "food resources",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 118,
                    width: 110,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().white,
                      borderRadius: BorderRadius.circular(6.0),
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
                        Image.asset(CPAAssets.food),
                        Text(
                          'Food',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
                        ),
                        Text(
                          'Resources',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
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
                        builder: (context) => WaterResource(
                          collectionName: "non-lethal protection",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 118,
                    width: 110,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().white,
                      borderRadius: BorderRadius.circular(6.0),
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
                        Image.asset(CPAAssets.nonlethal),
                        Text(
                          'Non-Lethal',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
                        ),
                        Text(
                          'Protection',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
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
                        builder: (context) => WaterResource(
                          collectionName: "communication resources",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 118,
                    width: 110,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().white,
                      borderRadius: BorderRadius.circular(6.0),
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
                        Image.asset(CPAAssets.communication),
                        Text(
                          'Communication',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBoxes.verticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaterResource(
                          collectionName: "bartering resources",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 118,
                    width: 110,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().white,
                      borderRadius: BorderRadius.circular(6.0),
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
                        Image.asset(CPAAssets.Bartering),
                        Text(
                          'Bartering',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
                        ),
                        Text(
                          'Items',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().black),
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
                        builder: (context) => WaterResource(
                          collectionName: "travel resources",
                        ),
                      ),
                    );
                  },
                  child: Container(
                      height: 118,
                      width: 110,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().white,
                        borderRadius: BorderRadius.circular(6.0),
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
                          Image.asset(CPAAssets.travel),
                          Text(
                            'Travel',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaterResource(
                          collectionName: "shelters resources",
                        ),
                      ),
                    );
                  },
                  child: Container(
                      height: 118,
                      width: 110,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().white,
                        borderRadius: BorderRadius.circular(6.0),
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
                          Image.asset(CPAAssets.shelters),
                          Text(
                            'Shelters',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBoxes.verticalLarge,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaterResource(
                          collectionName: "services",
                        ),
                      ),
                    );
                  },
                  child: Container(
                      height: 118,
                      width: 110,
                      decoration: BoxDecoration(
                        color: CPAColorTheme().white,
                        borderRadius: BorderRadius.circular(6.0),
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
                          Image.asset(CPAAssets.Services),
                          Text(
                            'Services',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
