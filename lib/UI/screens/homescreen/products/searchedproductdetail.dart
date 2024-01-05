import 'package:flutter/material.dart';

class SearchedproductScreen extends StatefulWidget {
  final Map<String, dynamic>? searchedProduct;

  const SearchedproductScreen({required this.searchedProduct});

  @override
  State<SearchedproductScreen> createState() => _SearchedproductScreenState();
}

class _SearchedproductScreenState extends State<SearchedproductScreen> {
  @override
  Widget build(BuildContext context) {
    print('Searched Product Data: ${widget.searchedProduct}');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchedProduct?['title'] ?? 'Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.searchedProduct?['image'] ?? '',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Title:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                widget.searchedProduct?['title'] ?? 'No Title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                widget.searchedProduct?['description'] ?? 'No Description',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press (e.g., navigate to the website)
                  },
                  child: Text('Visit Website'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
