import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:la_mode/components/horizontal_list view.dart';
import 'package:la_mode/components/Products.dart';
import 'package:la_mode/pages/Cart.dart';


class HomePage extends StatefulWidget{
  static String id = 'HomePage';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}
class _HomePageState extends State <HomePage>{
  TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build (BuildContext context){
    Widget imageCarousel = new Container(
      height:200.0,
      child: new Carousel(
        images: [
          Image.asset('images/c1.jpg',fit: BoxFit.fill,),
          Image.asset('images/c2.jpg',fit: BoxFit.fill,),
          Image.asset('images/c3.jpg',fit: BoxFit.fill,),
          Image.asset('images/c4.jpg',fit: BoxFit.fill,),
          Image.asset('images/c5.jpg',fit: BoxFit.fill,),
          Image.asset('images/c6.jpg',fit: BoxFit.fill,),
          Image.asset('images/c7.jpg',fit: BoxFit.fill,),
        ],
        autoplay: true,
        dotSize: 6.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title:Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100],
          elevation: 0.0,
          child: TextFormField(
            controller: _searchTextController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                hintText: "Search...",
                border: InputBorder.none),
            validator: (value) {
              if (value.isEmpty) {
                return "The search field cannot be empty";
              }
              return null;
            },
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: [
          new IconButton(icon:Icon(Icons.search, color: Colors.black,),onPressed: (){}),
          new IconButton(icon:Icon(Icons.shopping_cart, color: Colors.black,),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          })
        ],
      ),
      drawer:new Drawer(
        child: Container(
          color: Colors.black,
          child: new ListView(
            children: [
              new UserAccountsDrawerHeader(
                accountName: Text('Princess Aimy', style: TextStyle(fontFamily: 'Pacifico' , fontSize: 20.0),),
                accountEmail: Text('conanidogawa12@yahoo.com' , style: TextStyle(fontFamily: 'Pacifico' , fontSize: 15.0) ,),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ),
                ),
                decoration: new BoxDecoration(
                    color: Colors.black
                ),),
              Divider(color: Colors.white,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));
                },
                child: ListTile(
                  title: Text('Home Page',style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.home, color: Colors.white,),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My Account',style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My Orders',style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.shopping_basket, color: Colors.white,),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
                },
                child: ListTile(
                  title: Text('Shopping Cart',style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.shopping_cart, color: Colors.white,),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Favourite' ,style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.favorite, color: Colors.white,),
                ),
              ),
              Divider(color: Colors.white,),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings' ,style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.settings, color: Colors.white,),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('About' ,style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.help, color: Colors.white,),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Log out' ,style: TextStyle(color: Colors.white),),
                  leading: Icon(Icons.transit_enterexit, color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
      body: new Column(
        children: <Widget>[
          imageCarousel,
          Row(
            children: [
              new Padding(
                padding: const EdgeInsets.all(14.0),
                child:Container(alignment: Alignment.centerLeft,child: Text('Categories')),),
            ],
          ),
          HorizontalList(),
          Row(
            children: [
              new Padding(
                padding: const EdgeInsets.all(14.0),
                child:Container(alignment: Alignment.centerLeft,child: Text('Recent Products')),),
            ],
          ),
          Flexible(child: Products()),



        ],
      ),
    );
  }
}