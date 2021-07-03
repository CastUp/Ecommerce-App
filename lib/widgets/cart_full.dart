import 'package:ecommerce/provider/Cart_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class CartFull extends StatefulWidget {

  final int index;
  final String id ;
  final String title;
  final double price ;
  int quatity ;
  final String imageUrl ;

  CartFull({this.id, this.title, this.price, this.quatity, this.imageUrl, this.index});

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CartProvider>(
          builder:(context , value , child)
          => Container(
            height: MediaQuery.of(context).size.height * .20,
            margin: const EdgeInsets.only(top: 5, left: 5 ,right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).backgroundColor),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6)),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(child: Text(
                              this.widget.title,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            )),
                            InkWell(
                              child: Icon(Icons.delete_forever_outlined,color: Colors.red.shade500,),
                              onTap: ()=>value.removeItem(index: widget.index),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Price: " , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w600),),
                            Text("\$${widget.price}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Sub Total: " , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w600),),
                            Text("\$${(widget.price * widget.quatity).toStringAsFixed(2)}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Ships Free: " , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w600),),
                            SizedBox(width: 5,),
                            InkWell(
                              child: Icon(Entypo.minus),
                              onTap: ()=> value.quantityNum(index: widget.index,state: "-")
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.orange.shade200,
                              ),
                              child: Text("${widget.quatity}",style: TextStyle(fontSize: 15,),),
                            ),
                            InkWell(
                              child: Icon(Entypo.plus),
                              onTap: ()=>value.quantityNum(index: widget.index ,state: "*"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
