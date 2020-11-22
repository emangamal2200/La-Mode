import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mode/pages/homepage.dart';
import 'package:la_mode/pages/Cart.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPicture;
  final productDetailNewPrice;
  final productDetailOldPrice;

  ProductDetails(
      {this.productDetailName,
      this.productDetailPicture,
      this.productDetailNewPrice,
      this.productDetailOldPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Center(
          child: InkWell(
            child: Text(
              'La Mode',
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
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
          new IconButton(icon:Icon(Icons.shopping_cart, color: Colors.black,),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          })
        ],
      ),
      body: new ListView(
        children: [
          Container(
            height: 260.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture),
              ),
              footer: new Container(
                height: 35.0,
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.productDetailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: [
                      Expanded(
                        child: new Text(
                          "\$${widget.productDetailOldPrice}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\$${widget.productDetailNewPrice}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("Choose the size"),
                            actions: [
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: new Text("Size"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Choose the color"),
                            actions: [
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: new Text("Color"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose the quantity"),
                            actions: [
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: new Text("Qty"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy now",style: TextStyle(fontFamily: 'Pacifico' , fontSize: 18.0),),
                ),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.black,
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text(
                "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
          ),
          Divider(),
          new Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.productDetailName),
              ),
            ],
          ),
          new Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("brand X"),
              ),
            ],
          ),
          new Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("NEW"),),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Similar products"),
          ),
          Container(
            height: 340,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}
class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
    {
      "name":"Morning dress",
      "picture":"images/products/dress1.jpg",
      "oldPrice": 280,
      "price": 190,
    },
    {
      "name":" Men pants",
      "picture":"images/products/pant1.jpg",
      "oldPrice": 150,
      "price": 100,
    },
    {
      "name":"Mini skirt",
      "picture":"images/products/skt1.jpg",
      "oldPrice": 280,
      "price": 190,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return SimilarProduct(
            prodName: productList[index]["name"],
            prodPicture: productList[index]["picture"],
            prodOldPrice: productList[index]["oldPrice"],
            prodNewPrice: productList[index]["price"],
          );
        });
  }
}

class SimilarProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodNewPrice;
  SimilarProduct({
    this.prodName,
    this.prodPicture,
    this.prodOldPrice,
    this.prodNewPrice
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("hero 1"),
        child: Material(
          child: InkWell(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ProductDetails(
              productDetailName: prodName,
              productDetailPicture: prodPicture,
              productDetailNewPrice: prodNewPrice,
              productDetailOldPrice: prodOldPrice,
            ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: new Row(
                  children: [
                    Expanded(
                        child: new Text(prodName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),)
                    ),
                    new Text("\$$prodNewPrice", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              child: Image.asset(prodPicture,fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}


