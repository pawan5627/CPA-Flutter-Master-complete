import '../../export.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Change the outline color as needed
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            CPAAssets
                .GoogleLogo, // Replace with the path to your Google logo image
            height: 60.0,
            width: 40.0,
          ),
          Text(
            'Continue with Google',
            style: CPATextTheme().body.copyWith(
                  fontSize: 14,
                  height: 1,
                ),
          )
        ],
      ),
    );
  }
}
