import 'package:cpa/export.dart';

class ReusableDropDown extends StatefulWidget {
  final Function(String value) onTap;
  final List<String> items;

  const ReusableDropDown({Key? key, required this.onTap, required this.items})
      : super(key: key);

  @override
  _ReusableDropDownState createState() => _ReusableDropDownState();
}

class _ReusableDropDownState extends State<ReusableDropDown> {
  String selectedValue = 'Make a selection';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          widget.onTap(value ?? "No");
          selectedValue = value!;
        });
      },
      items: ['Make a selection', ...widget.items].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: 'Make a selection',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: CPAColorTheme().primaryblue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: CPAColorTheme().primaryblue,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
