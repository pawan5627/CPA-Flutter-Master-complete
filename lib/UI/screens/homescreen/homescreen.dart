// ignore_for_file: unused_import

import 'package:cpa/UI/screens/homescreen/products/products_screen.dart';
import 'package:cpa/UI/screens/homescreen/products/water_resources.dart';
import 'package:cpa/UI/screens/homescreen/widgets/recommmendation2.dart';
import 'package:cpa/UI/screens/homescreen/widgets/side_navbar/recomendation.dart';
import 'package:cpa/export.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../searchscreen.dart';
import 'CPA.dart';
import 'news/newsPage.dart';

class HomeScreen extends StatefulWidget {
  final String? uid;
  final String liveNewsUrl = 'https://www.youtube.com/watch?v=hEuth_yWuAE';

  const HomeScreen({Key? key, this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late YoutubePlayerController _youtubeController;
    late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    // String videoId = YoutubePlayer.convertUrlToId(widget.liveNewsUrl) ?? "";
    // _youtubeController = YoutubePlayerController(
    //   initialVideoId: videoId,
    //   flags: YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: false,
    //   ),
    // );

    _videoController = VideoPlayerController.networkUrl( 
      Uri.parse(widget.liveNewsUrl)
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.isCurrent) {
      // Screen is being displayed
      unmuteVideo();
    } else {
      // Screen is not visible
      muteVideo();
    }
  }

  // Function to mute the video
  void muteVideo() {
    _videoController.setVolume(0);
  }

  // Function to unmute the video
  void unmuteVideo() {
    _videoController.setVolume(100);
  }

  @override
  deactivate() {
    print("deactivate called");
    _videoController.dispose();
    super.deactivate();
  }

  @override
  void dispose() {
    print("Dispose called");
    _videoController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CPAColorTheme().white,
          leading: IconButton(
            color: CPAColorTheme().primaryblue,
            onPressed: () {
              dispose();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SideNavbar(uid: widget.uid),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBoxes.horizontalMedium,
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  CPAAssets.CpaLogo,
                  width: 90, // Set the desired width
                  height: 70, // Set the desired height
                ),
              ),
              IconButton(
                color: CPAColorTheme().primaryblue,
                iconSize: 40,
                onPressed: () {
                  dispose();
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 433,
                height: 359,
                color: CPAColorTheme().primaryblue,
                child: FutureBuilder(
                  future: _videoController.initialize(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return VideoPlayer(_videoController);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(12)

                        borderRadius: BorderRadius.zero, // No rounded corners
                      ),
                      elevation: 8,
                      child: Container(
                        height: 113,
                        width: 100,
                        color: CPAColorTheme().primarygolden,
                        child: ElevatedButton(
                          onPressed: () {
                            dispose();
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CPAColorTheme().primarygolden,
                            elevation: 0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(CPAAssets.LatestNews),
                              Text('Latest',
                                  style: CPATextTheme().body.copyWith(
                                      color: CPAColorTheme().white,
                                      fontWeight: FontWeight.w600)),
                              Text('News',
                                  style: CPATextTheme().body.copyWith(
                                      color: CPAColorTheme().white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(12)
                        borderRadius: BorderRadius.zero,
                      ),
                      elevation: 8,
                      child: Container(
                        height: 113,
                        width: 100,
                        color: CPAColorTheme().white,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CPAColorTheme().white,
                              elevation: 0,
                            ),
                            onPressed: () {
                              dispose();
              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProductsHome(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(CPAAssets.Products),
                                SizedBoxes.verticalMicro,
                                Text(
                                  'Products',
                                  style: CPATextTheme().small.copyWith(
                                      color: CPAColorTheme().primaryblue),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(12/)
                          //

                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 8,
                        child: Container(
                          height: 113,
                          width: 100,
                          color: CPAColorTheme().white,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CPAColorTheme().white,
                                elevation: 0,
                              ),
                              onPressed: () {
                                dispose();
              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WebsiteHome(),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(CPAAssets.Websites),
                                  SizedBoxes.verticalMicro,
                                  Text(
                                    'Websites',
                                    style: CPATextTheme().small.copyWith(
                                        color: CPAColorTheme().primaryblue),
                                  ),
                                ],
                              )),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        // borderRadius: BorderRadius.circular(12)
                      ),
                      elevation: 8,
                      child: Container(
                        height: 113,
                        width: 100,
                        color: CPAColorTheme().white,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CPAColorTheme().white,
                              elevation: 0,
                            ),
                            onPressed: () {
                              dispose();
              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TrainingHome(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(CPAAssets.Training),
                                Text(
                                  'Trainings',
                                  style: CPATextTheme().small.copyWith(
                                      color: CPAColorTheme().primaryblue),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(12)
                        borderRadius: BorderRadius.zero,
                      ),
                      elevation: 8,
                      child: Container(
                        height: 113,
                        width: 120,
                        color: CPAColorTheme().white,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CPAColorTheme().white,
                              elevation: 0,
                            ),
                            onPressed: () {
                              dispose();
              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Recomendation(
                                      collectionName: 'recomendation',
                                      uid: widget.uid),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(CPAAssets.Products),
                                Text(
                                  'Recomendation',
                                  style: CPATextTheme().small.copyWith(
                                      color: CPAColorTheme().primaryblue),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(12)
                        borderRadius: BorderRadius.zero,
                      ),
                      elevation: 8,
                      child: Container(
                        height: 113,
                        width: 100,
                        color: CPAColorTheme().white,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CPAColorTheme().white,
                              elevation: 0,
                            ),
                            onPressed: () {
                              dispose();
              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WaterResource(
                                    collectionName: "services",
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(CPAAssets.Services),
                                Text(
                                  'Services',
                                  style: CPATextTheme().small.copyWith(
                                      color: CPAColorTheme().primaryblue),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBoxes.verticalBig,
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 92,
                      width: 150,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: CPAColorTheme().primaryblue),
                      child: ElevatedButton(
                          // style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.transparent,
                          // ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              // Icon(
                              //   Icons.location_on_outlined,
                              //   size: 12,
                              // ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Canyon Rd,',
                                      style: CPATextTheme().small.copyWith(
                                          color: CPAColorTheme().white),
                                    ),
                                  ),
                                  Text(
                                    'Mayfield, UT 84643,USA',
                                    style: CPATextTheme()
                                        .extrasmall
                                        .copyWith(color: CPAColorTheme().white),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Container(
                      height: 92,
                      width: 150,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: CPAColorTheme().primarygolden),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {
                            dispose();
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CPA_Screen(uid: widget.uid),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(CPAAssets.CpApplication),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('View',
                                        textAlign: TextAlign.left,
                                        style: CPATextTheme().body.copyWith(
                                            color: CPAColorTheme().white)),
                                  ),
                                  Text(
                                    'Your CPA Report',
                                    style: CPATextTheme()
                                        .extrasmall
                                        .copyWith(color: CPAColorTheme().white),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  launchURL("https://www.disasterassistance.gov/");
                },
                child: const Text(
                  "Tap",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {},
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/wizard.png',
                        height: 30,
                      ),
                      const Text(
                        "Wizard",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> launchURL(String url) async {
    if (await canLaunchUrl((Uri.parse(url)))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
