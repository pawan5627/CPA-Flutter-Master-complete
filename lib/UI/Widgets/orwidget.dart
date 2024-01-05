import '../../export.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.0, // Set your desired width
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: CPAColorTheme().neutral300,
              thickness: 1.5,
            ),
          ),
          SizedBoxes.horizontalMicro,
          Text(
            'or',
            style: CPATextTheme().body.copyWith(
                  fontWeight: FontWeights.medium,
                  color: CPAColorTheme().neutral500,
                ),
          ),
          SizedBoxes.horizontalMicro,
          Expanded(
            child: Divider(
              color: CPAColorTheme().neutral300,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
