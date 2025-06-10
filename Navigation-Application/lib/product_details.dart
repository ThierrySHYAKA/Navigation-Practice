import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( product.name, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold,),),
        backgroundColor: getColor(product.color),
      ),
      body: Column(
        children: [
          // Top colored container
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35, // Adjust height
            color: getColor(product.color),
            alignment: Alignment.center,
            child: Text(
              product.name.toLowerCase(),
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          // Product details
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center( child:
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),),
                  SizedBox(height: 10),
                  Center( child:
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 18),
                  ),),
                  SizedBox(height: 10),
                  Center( child:
                  Text(
                    "Price: \$${product.price}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),),
                  // Star Ratings using list.generate to display icons instead of pasting them many times
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(3, (index) {
                      return Icon(product.name == "Tablet" ? Icons.star :Icons.star_border, color: Colors.red, size: 30);
                    }),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Convert color string to actual Color
  Color getColor(String color) {
    switch (color) {
      case "blue": return Colors.blue;
      case "green": return Colors.green;
      case "yellow": return Colors.yellow;
      case "red": return Colors.red;
      case "brown": return Colors.brown;
      default: return Colors.grey;
    }
  }
}
