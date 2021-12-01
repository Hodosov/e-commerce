import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage()));
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("FashApp"),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.white,)),
           IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart, color: Colors.white,))
        ],
      ),
    );
  }
}