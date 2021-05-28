import 'package:ecommerce/widgets/cart_empty.dart';
import 'package:ecommerce/widgets/cart_full.dart';
import 'package:flutter/material.dart';


class Cart extends StatelessWidget {
  List products = [];

  @override
  Widget build(BuildContext context) {
    return  products.isEmpty ? Scaffold(
      body: CartEmpty(),) : Scaffold(
      appBar:AppBar(
        title: Text("Cart Items Count  "+products.length.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10),
            icon: Icon(Icons.delete),
            onPressed: (){},
          ),
        ],
      ) ,
      body:Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.09,),
        child:ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index)=> CartFull(),
        ),
      ),
      bottomSheet:Container(
        height: MediaQuery.of(context).size.height*.085,
        padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: MediaQuery.of(context).size.width*.35,
                child: TextButton(
                  onPressed: (){},
                  child: Text("Check out",style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 20 , color: Theme.of(context).textSelectionTheme.selectionColor),),
                  style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.red,width: .50))
                  ),
                )
            ),
            Container(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Total: ",
                          style: TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor , fontSize: 18 , fontWeight: FontWeight.w600 )
                      ),
                      TextSpan(
                          text: "\$${450}",
                          style: TextStyle(color: Colors.red.shade500 , fontSize: 18 , fontWeight: FontWeight.w600 ,))
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}