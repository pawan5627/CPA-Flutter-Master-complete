import 'package:cpa/UI/screens/splashscreen/splash_screen.dart';
import 'package:cpa/export.dart';
 import 'package:shared_preferences/shared_preferences.dart';

class MainSplash extends StatefulWidget {
  const MainSplash({super.key});

  @override
  State<MainSplash> createState() => _MainSplashState();
}

class _MainSplashState extends State<MainSplash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () async {
      bool? login = await checkLogin();
      bool? isAnalyzeComplete = await checkAnalyzing();
      if (login == null || login == false) {
        if (isAnalyzeComplete == null || isAnalyzeComplete == false) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => SplashWidget(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => LoginScreen(),
            ),
          );
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      }
    });

    super.initState();
  }

  Future<bool?> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isLogin');
  }

  Future<bool?> checkAnalyzing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isAnalyzeComplete');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(CPAAssets.CpaLogo),
      ),
    );
  }
}
