import 'package:flutter/material.dart';

class CartProds extends StatefulWidget {
  @override
  _CartProdsState createState() => _CartProdsState();
}

class _CartProdsState extends State<CartProds> {
  var cartProduct = [
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpg",
      "price": 250,
      "size":"M",
      "color": "grey",
      "quantity": 1

    },
    {
      "name":" Men pants",
      "picture":"images/products/pant1.jpg",
      "price": 100,
      "size":"L",
      "color": "black",
      "quantity": 1
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: cartProduct.length,
        itemBuilder: (context, index){
          return new SingleCartProd(
            cartProdName: cartProduct[index]["name"],
            cartProdPicture: cartProduct[index]["picture"],
            cartProdPrice: cartProduct[index]["price"],
            cartProdSize: cartProduct[index]["size"],
            cartProdColor: cartProduct[index]["color"],
            cartProdQty: cartProduct[index]["quantity"],
          );
        });
  }
}
class SingleCartProd extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  final cartProdQty;
  SingleCartProd({
    this.cartProdName,
    this.cartProdPicture,
    this.cartProdPrice,
    this.cartProdSize,
    this.cartProdColor,
    this.cartProdQty
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: Container(
          width: 100.0,
          height: 100.0,
          child: new Image.asset(cartProdPicture,),),
        title: new Text(cartProdName,style: TextStyle(color: Colors.grey),),
        subtitle: new Column(
          children: [
            new Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("size:", style: TextStyle(color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cartProdSize,style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 4.0, 8.0),
                  child: Text("color:",style: TextStyle(color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(cartProdColor,style: TextStyle(color: Colors.grey),),
                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("\$$cartProdPrice",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.grey,
              ),),
            ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: [
              new IconButton(icon: Icon(Icons.arrow_drop_up,color: Colors.white,size: 38.0,), onPressed: null),
              new Text("$cartProdQty",style: TextStyle(color: Colors.grey,fontSize: 25.0),),
              new IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 38.0,), onPressed: null),
            ],
          ),
        ),),
    );
  }
}

