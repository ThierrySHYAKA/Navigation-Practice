import 'package:flutter/material.dart';
import 'product.dart';
import 'product_details.dart';

class ProductListPage extends StatelessWidget {
  //using list to take info about each product and their colors
  final List<Product> products = [
    Product(name: "Pixel 1", description: "Pixel is the most featureful phone ever", price: 800, color: "blue"),
    Product(name: "Laptop", description: "Laptop is the most productive development tool", price: 2000, color: "green"),
    Product(name: "Tablet", description: "Tablet is the most useful device ever for meeting", price: 1500, color: "yellow"),
    Product(name: "Pendrive", description: "Pendrive is the best storage device", price: 100, color: "red"),
    Product(name: "Floppy Drive", description: "Floppy Drive is a classic storage device", price: 50, color: "brown"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Navigation", style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold,),),
      backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              //list view to display scrollable items
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        //container to display product name and it's color
                        width: 160,
                        height: 160,
                        color: getColor(products[index].color),
                        alignment: Alignment.center,
                        child: Text(
                          products[index].name.toLowerCase(),
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          //displaying product info from list using listTile
                          title: Center( child: Text(
                            products[index].name,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].description),
                              Center( child: Text("Price: \$${products[index].price}", style: TextStyle(fontWeight: FontWeight.bold)),),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Icon(
                                    products[index].name == "Tablet" ? Icons.star : Icons.star_border,
                                    color: Colors.red,
                                  ),
                                  Icon(
                                    products[index].name == "Tablet" ? Icons.star : Icons.star_border,
                                    color: Colors.red,
                                  ),
                                  Icon(
                                    products[index].name == "Tablet" ? Icons.star : Icons.star_border,
                                    color: Colors.red,
                                  ),

                                ]
                              ),
                            ],
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(product: products[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

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
