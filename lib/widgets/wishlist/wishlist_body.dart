import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:ration_now/models/product.dart';

class WishListBody extends StatefulWidget {
  const WishListBody({Key? key}) : super(key: key);

  @override
  State<WishListBody> createState() => _WishListBodyState();
}

class _WishListBodyState extends State<WishListBody> {
  List<Product> products = [];

  // Fetch data from the API
  void getData() async {
    var url = Uri.parse("https://dummyjson.com/products");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var jsonData = jsonResponse['products'];

      // Convert JSON data to a list of Product objects
      products = List<Product>.from(
        jsonData.map(
          (item) => Product(
            image: item['thumbnail'],
            name: item['title'],
            unit: item['stock'],
            price: item['price'].toDouble(),
          ),
        ),
      );

      // Trigger a rebuild of the widget tree
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is first created
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // Default content while waiting for data
    Widget content = const Center(
      child: Text("Waiting for data"),
    );

    // If products are available, display them in a ListView
    if (products.isNotEmpty) {
      content = ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Image.network(
                        products[index].image,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '  ${products[index].unit} units',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            ' ₹ ${products[index].price}',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0, // Adjust the position as needed
                    right: 0, // Adjust the position as needed
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button click logic here
                        print('Add button clicked for ${products[index].name}');
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
    return content;
  }
}
