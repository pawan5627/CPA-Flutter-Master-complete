import 'package:cpa/UI/screens/Analysis/analysis_page1.dart';
import 'package:cpa/export.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final List<String> images = [
    'assets/images/cpalogo.png',
    'assets/Frame.png',
    'assets/images/cpalogo.png',
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController();
  final int numberOfImages = 3;
  bool showContainer = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _nextPage();
    });
  }

  void _nextPage() {
    if (_currentPage < numberOfImages - 1) {
      _pageController.nextPage(
        duration: const Duration(seconds: 2),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: numberOfImages,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
          if (page == numberOfImages - 1) {
            _nextPage();
          }
        },
        itemBuilder: (context, index) {
          return SplashScreenPage(
            image: images[index],
            isLastScreen: index == numberOfImages - 1,
            pageController: _pageController,
          );
        },
      ),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  final String image;
  final bool isLastScreen;
  final PageController pageController;

  SplashScreenPage({
    required this.image,
    required this.isLastScreen,
    required this.pageController,
  });

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late Duration animationDuration;

  @override
  void initState() {
    super.initState();
    animationDuration = widget.isLastScreen
        ? const Duration(seconds: 3)
        : const Duration(seconds: 3);
    if (!widget.isLastScreen) {
      Future.delayed(const Duration(seconds: 3), () {
        _nextPage();
      });
    }
  }

  void _nextPage() {
    if (widget.pageController.page == 0) {
      widget.pageController.animateToPage(
        1,
        duration: const Duration(seconds: 3),
        curve: Curves.ease,
      );
    }
    if (widget.pageController.page == 1) {
      widget.pageController.animateToPage(
        2,
        duration: const Duration(seconds: 3),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/Framebg.png',
            width: MediaQuery.of(context).size.width, // Make it full-width
            height: MediaQuery.of(context).size.height *
                0.45, // Adjust the height as needed
            fit: BoxFit.fitWidth,
          ),
        ),
        if (widget.image == 'assets/images/cpalogo.png')
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.easeOut,
              height: 200,
              width: 200,
              child: Image.asset(widget.image),
            ),
          ),
        if (widget.image == 'assets/Frame.png' && !widget.isLastScreen)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBoxes.verticalExtraGargangua,
              Image.asset(CPAAssets.CpaLogo),
              Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedContainer(
                  duration: animationDuration,
                  curve: Curves.easeOut,
                  height: 200,
                  width: 200,
                  child: Image.asset(widget.image),
                ),
              ),
            ],
          ),
        if (widget.isLastScreen)
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 340,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 232, 224, 224).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome!',
                      style: CPATextTheme().heading4.copyWith(
                            color: CPAColorTheme().primarygolden,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Click the link below to get your Personal',
                          style: CPATextTheme().body.copyWith(
                                color: CPAColorTheme().black,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Comprehensive Preparedness Analysis (CPA)',
                          style: CPATextTheme().body.copyWith(
                              color: CPAColorTheme().black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'tailored specifically to you and your family\'s needs\n in a matter of minutes!',
                          style: CPATextTheme().body.copyWith(
                                color: CPAColorTheme().black,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 238,
                      height: 39,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnalysisScreen1(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: CPAColorTheme()
                              .primaryblue, // Set the button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Set the button border radius to zero for no rounding
                          ),
                        ),
                        child: Text(
                          'Begin Analysis',
                          style: CPATextTheme().body.copyWith(
                                fontSize: 16,
                                height: 1,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedContainer(
                  duration: animationDuration,
                  curve: Curves.easeOut,
                  height: 400,
                  width: 400,
                  child: Image.asset('assets/images/cpalogo.png'),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
