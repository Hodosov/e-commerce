import 'package:flutter/material.dart';

class HorisontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
              image_locations: 'images/cats/accessories.png',
              image_caption: 'accessories'),
          Category(
              image_locations: 'images/cats/dress.png',
              image_caption: 'dress'),
          Category(
              image_locations: 'images/cats/formal.png',
              image_caption: 'formal'),
          Category(
              image_locations: 'images/cats/informal.png',
              image_caption: 'informal'),
          Category(
              image_locations: 'images/cats/jeans.png',
              image_caption: 'jeans'),
          Category(
              image_locations: 'images/cats/shoe.png',
              image_caption: 'shoe'),
          Category(
              image_locations: 'images/cats/tshirt.png',
              image_caption: 'tshirt'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_locations;
  final String image_caption;

  Category({required this.image_locations, required this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_locations,
              width: 100,
              height: 80,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption, style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
