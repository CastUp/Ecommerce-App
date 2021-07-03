import 'package:ecommerce/models/cart_atrr.dart';
import 'package:ecommerce/provider/Cart_Provider.dart';
import 'package:ecommerce/widgets/cart_empty.dart';
import 'package:ecommerce/widgets/cart_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Cart extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    return Consumer<CartProvider>(
        builder: (context , value , child)
          => value.listCartItems.isEmpty ?
          Scaffold(
              body: CartEmpty(),)
              :
          Scaffold(
              appBar:AppBar(
                title: Text("Cart Items Count  "+value.listCartItems.length.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                actions: [
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    icon: Icon(Icons.delete),
                    onPressed: ()=>value.removelistItems(),
                  ),
                ],
              ) ,
              body:Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.09,),
                child:ListView.builder(
                  itemCount: value.listCartItems.length,
                  itemBuilder: (_, index)=> CartFull(id: value.listCartItems[index].id,title: value.listCartItems[index].title,
                                quatity: value.listCartItems[index].quantity,price: value.listCartItems[index].price,
                                imageUrl: value.listCartItems[index].imageUrl,index: index,),
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
                                  text: "\$${value.totalAmount.toStringAsFixed(2)}",
                                  style: TextStyle(color: Colors.red.shade500 , fontSize: 18 , fontWeight: FontWeight.w600 ,))
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            )
    );

  }

  
}