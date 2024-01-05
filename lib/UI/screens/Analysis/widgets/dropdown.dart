import 'package:cpa/export.dart';

class SimpleDropdown extends StatefulWidget {
  final Function(String value) onTap;

  const SimpleDropdown({super.key, required this.onTap});
  @override
  _SimpleDropdownState createState() => _SimpleDropdownState();
}

class _SimpleDropdownState extends State<SimpleDropdown> {
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
      items: ['Make a selection', 'Yes', 'No'].map((String value) {
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
