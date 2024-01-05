import '../../export.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: CPAColorTheme().neutral100,
            thickness: 1,
          ),
        ),
        SizedBoxes.horizontalMicro,
        Text('Or Login with',
            style: CPATextTheme().body.copyWith(
                  fontWeight: FontWeights.medium,
                  color: CPAColorTheme().neutral500,
                )),
        SizedBoxes.horizontalMicro,
        Expanded(
          child: Divider(
            color: CPAColorTheme().neutral100,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
