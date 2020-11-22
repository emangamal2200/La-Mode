import 'package:flutter/material.dart';
import 'package:la_mode/components/cardprods.dart';
import 'package:la_mode/pages/homepage.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Center(
          child: InkWell(
            child: Text(
              'Cart',
              style: TextStyle(fontFamily: 'Modak',
                  fontSize: 28.0,color: Colors.black),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));
            },
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: [
          new IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: () {}),
        ],
      ),
      body: new CartProds(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: [Expanded(child: ListTile(
            title: Text('Total:'),
            subtitle: Text('\$230'),
          ),),
          Expanded(
            child: new MaterialButton(
              onPressed: (){},
              child: Text('Check out',style: TextStyle(color: Colors.white),),
              color: Colors.black,
            ),
          )],
        ),
      ),
    );
  }
}
