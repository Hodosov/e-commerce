import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(widget.product_detail_name)),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product_detail_name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "\$${widget.product_detail_old_price}",
                        style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: Text(
                        "\$${widget.product_detail_new_price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Size'),
                          content: const Text('Choose the size'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: const [
                    Expanded(child: Text("Size")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Color'),
                          content: const Text('Choose the color'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: const [
                    Expanded(child: Text("Color")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Qty'),
                          content: const Text('Choose the qty'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: const [
                    Expanded(child: Text("Qty")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0.2,
                      child: const Text('Buy now'))),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, color: Colors.red)),
            ],
          ),
          const Divider(),
          const ListTile(
            title: Text("Product details"),
            subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
          ),
          const Divider(),
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(widget.product_detail_name),
              )
            ],
          ),
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Brand"),
              )
            ],
          ),
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Condition"),
              )
            ],
          ),
         const Divider(),
         const Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Similar products'),
          ),
          Container(
            height: 390,
            child: Similar_product(),
          )
        ],
      ),
    );
  }
}

class Similar_product extends StatefulWidget {
  Similar_product({Key? key}) : super(key: key);

  @override
  _Similar_productState createState() => _Similar_productState();
}

class _Similar_productState extends State<Similar_product> {
  var product_list = [
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Pant",
      "picture": "images/products/pants1.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Pant",
      "picture": "images/products/pants2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": 100,
      "price": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_pictire: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pictire;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod(
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              product_detail_name: prod_name,
                              product_detail_new_price: prod_price,
                              product_detail_old_price: prod_old_price,
                              product_detail_picture: prod_pictire,
                            ))),
                    child: GridTile(
                        footer: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  prod_name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                                Text(
                                  '\$$prod_price',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        child: Image.asset(prod_pictire, fit: BoxFit.cover)),
                  ),
                ))));
  }
}
