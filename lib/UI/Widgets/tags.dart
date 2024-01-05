import 'package:flutter/material.dart';

class SelectableTags extends StatelessWidget {
  final List<String> tags;
  final String selectedTag;
  final Function(String) onSelectionChanged;

  SelectableTags({
    required this.tags,
    required this.selectedTag,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Adjust spacing between tags
      children: tags.map((tag) {
        final isSelected = tag == selectedTag;

        return GestureDetector(
          onTap: () {
            if (!isSelected) {
              onSelectionChanged(tag);
            }
          },
          child: Chip(
            label: Text(
              tag,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.blue, // Text color
              ),
            ),
            backgroundColor:
                isSelected ? Colors.blue : Colors.white, // Background color
            elevation: isSelected ? 2 : 0, // Elevation for selected tags
            shape: StadiumBorder(
              side: BorderSide(
                color: Colors.blue, // Border color
                width: isSelected ? 0 : 1, // Border width for unselected tags
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
