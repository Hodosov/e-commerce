import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/product.dart';

class Products extends StatefulWidget {
  Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_pictire: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pictire;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_pictire,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Hero(
                tag: prod_name,
                child: Material(
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              product_detail_name: prod_name,
                              product_detail_new_price: prod_price,
                              product_detail_old_price: prod_old_price,
                              product_detail_picture: prod_pictire,
                            ))),
                    child: GridTile(
                        footer: Container(
                          color: Colors.white70,
                          child: ListTile(
                            leading: Text(
                              prod_name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              '\$$prod_price',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              '\$$prod_old_price',
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        ),
                        child: Image.asset(prod_pictire, fit: BoxFit.cover)),
                  ),
                ))));
  }
}
