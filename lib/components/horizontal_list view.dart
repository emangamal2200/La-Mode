import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            imageLocation: 'images/icons/shirt.png',
            imageCaption: 'shirt',
          ),
          Category(
            imageLocation: 'images/icons/dress.png',
            imageCaption: 'dress',
          ),
          Category(
            imageLocation: 'images/icons/pants.png',
            imageCaption: 'pants',
          ),
          Category(
            imageLocation: 'images/icons/suit.png',
            imageCaption: 'formal',
          ),
          Category(
            imageLocation: 'images/icons/jacket.png',
            imageCaption: 'informal',
          ),
          Category(
            imageLocation: 'images/icons/jewel.png',
            imageCaption: 'accessory',
          ),
          Category(
            imageLocation: 'images/icons/shoes.png',
            imageCaption: 'shoes',
          ),
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  Category({this.imageLocation,this.imageCaption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 60.0,
            ),
            subtitle: Container(
              padding: EdgeInsets.all(3.0),
              alignment: Alignment.topCenter,
              child: Text(
                  imageCaption,style: TextStyle(fontSize: 13.0),
                  ),
                ),
            ),
          ),
        ),
      );
  }
}

