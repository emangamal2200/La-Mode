import 'package:flutter/material.dart';
import 'package:la_mode/pages/productDetails.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpg",
      "oldPrice": 290,
      "price": 250,
    },
    {
      "name":"Morning dress",
      "picture":"images/products/dress1.jpg",
      "oldPrice": 280,
      "price": 190,
    },
    {
      "name":"Formal heels",
      "picture":"images/products/heels1.jpg",
      "oldPrice": 220,
      "price": 150,
    },
    {
      "name":" Men pants",
      "picture":"images/products/pant1.jpg",
      "oldPrice": 150,
      "price": 100,
    },
    {
      "name":" Black shoes",
      "picture":"images/products/shoose1.jpg",
      "oldPrice": 480,
      "price": 420,
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
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProduct(
              prodName: productList[index]["name"],
              prodPicture: productList[index]["picture"],
              prodOldPrice: productList[index]["oldPrice"],
              prodNewPrice: productList[index]["price"],
            ),
          );
        });
  }
}
class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodNewPrice;
  SingleProduct({
    this.prodName,
    this.prodPicture,
    this.prodOldPrice,
    this.prodNewPrice
});
  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Colors.white,
              child: ListTile(title: Text(prodName, style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                trailing: Text("\$$prodNewPrice", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),

              ),
            ),
            child: Image.asset(prodPicture,fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}

