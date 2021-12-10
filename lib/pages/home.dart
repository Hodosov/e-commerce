import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/horizontal_lustview.dart';
import 'package:flutter_application_1/components/products.dart';

import 'cart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = SizedBox(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: const [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(microseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 8,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: const Text("FashApp"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Santos'),
              accountEmail: const Text("Santos@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("My account"),
                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: const ListTile(
                title: Text("Shopping cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // image_carousel,
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Caregories'),
              )),
          HorisontalList(),
          Padding(
            child: Container(
              child: const Text('Recent products'),
              alignment: Alignment.centerLeft,
            ),
            padding: const EdgeInsets.all(12.0),
          ),
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
