import 'package:flutter/material.dart';

class Card_products extends StatefulWidget {
  Card_products({Key? key}) : super(key: key);

  @override
  _Card_productsState createState() => _Card_productsState();
}

class _Card_productsState extends State<Card_products> {
  var Products_on_the_cart = [
    {
      "name": "Dress",
      "picture": "images/products/dress2.jpeg",
      "price": 50,
      "size": "M",
      "color": 'Red',
      "quantity": 1
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "price": 85,
      "size": "L",
      "color": 'Black',
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_card_product(
            card_prod_name: Products_on_the_cart[index]["name"],
            card_prod_pictire: Products_on_the_cart[index]["picture"],
            card_prod_price: Products_on_the_cart[index]["price"],
            card_prod_size: Products_on_the_cart[index]["size"],
            card_prod_color: Products_on_the_cart[index]["color"],
            card_prod_quantity: Products_on_the_cart[index]["quantity"],
          );
        });
  }
}

class Single_card_product extends StatelessWidget {
  final card_prod_name;
  final card_prod_pictire;
  final card_prod_price;
  final card_prod_size;
  final card_prod_color;
  final card_prod_quantity;

  Single_card_product(
      {this.card_prod_name,
      this.card_prod_pictire,
      this.card_prod_price,
      this.card_prod_size,
      this.card_prod_color,
      this.card_prod_quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Image.asset(
            card_prod_pictire,
            width: 80,
            height: 80,
          ),
          title: Text(card_prod_name),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Text('Size:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      card_prod_size,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text('Color:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(card_prod_color,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '\$$card_prod_price',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          trailing: Column(
            children: <Widget>[
              SizedBox(
                height: 18.0,
                width: 18.0,
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_up, size: 18.0)),
              ),
              Text('$card_prod_quantity'),
              SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down, size: 18.0)))
            ],
          )),
    );
  }
}
