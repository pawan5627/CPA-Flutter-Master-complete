import 'package:flutter/material.dart';
import '../../services/fetch_services.dart';
import 'homescreen/products/searchedproductdetail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> displayedProducts = [];
  Map<String, dynamic>? selectedProduct;

  @override
  void initState() {
    super.initState();
  }

  void filterProducts(String query) async {
    try {
      // Use FirebaseService to fetch products
      List<Map<String, dynamic>> products =
          await FirebaseService().searchProducts(query);

      setState(() {
        displayedProducts = products;
      });
    } catch (e) {
      print('Error filtering products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterProducts,
              decoration: InputDecoration(
                labelText: 'Search for products',
                prefixIcon: Icon(Icons.search,
                    color: Colors.black), // Set the icon color to black
                fillColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0),
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the border radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0),
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the border radius as needed
                ),
                labelStyle: TextStyle(
                    color: Colors.black), // Set the label (text) color to black
                prefixStyle: TextStyle(
                    color:
                        Colors.black), // Set the prefix (icon) color to black
                focusColor: Colors.black, // Set the focus color to black
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 1,
                childAspectRatio: 3,
                mainAxisExtent: 200,
              ),
              itemCount: displayedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Column(
                      children: [
                        // Check if the image URL is available
                        displayedProducts[index]['image'] != null
                            ? Image.network(
                                displayedProducts[index]['image']!,
                                width: 100,
                                height: 100,
                              )
                            : Placeholder(), // Replace with a placeholder image or handle accordingly
                        Text(
                          displayedProducts[index]['title'] ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        selectedProduct = displayedProducts[index];
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchedproductScreen(
                            searchedProduct: displayedProducts[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
