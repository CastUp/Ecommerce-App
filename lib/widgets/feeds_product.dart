import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';



class FeedProducts extends StatefulWidget {

  final double width ;
  final int  index ;
  final List<Product> listProduct ;
  FeedProducts({this.width, this.listProduct, this.index,});
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {



  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).backgroundColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4)),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 100 ,
                    maxHeight: MediaQuery.of(context).size.height*.30,
                  ),
                  child: Image.network(widget.listProduct[widget.index].imageUrl, fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                bottom: 1,
                right: 3,
                child: Badge(
                  toAnimate: true,
                  animationDuration: Duration(seconds: 2),
                  elevation: 4,
                  shape: BadgeShape.square,
                  badgeColor: Colors.red.shade500,
                  borderRadius: BorderRadius.circular(4),
                  badgeContent: Text("New",style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(left: 5,bottom: 2,right: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5,),
                Text(widget.listProduct[widget.index].title,
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15, color: Theme.of(context).textSelectionTheme.selectionColor,fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("\$ ${widget.listProduct[widget.index].price.toString()}",
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 17, color: Theme.of(context).textSelectionTheme.selectionColor,fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.listProduct[widget.index].quantity.toString(),
                      softWrap: false,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 15, color: Colors.grey,fontWeight: FontWeight.w600),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: Icon(Icons.more_horiz, color: Colors.grey,),
                        splashColor: Colors.yellow.shade300,
                        borderRadius: BorderRadius.circular(20),
                        onTap: (){},
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
