import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';


class PopularProduct extends StatelessWidget {
  
  final List<Product>listPopular ;
  final int index ;

  PopularProduct({this.listPopular, this.index});
  @override
  Widget build(BuildContext context) {


    return Container(
      width: MediaQuery.of(context).size.width*.55,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4)),
                    image: DecorationImage(
                      image: NetworkImage(listPopular[index].imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                onTap: ()=>Navigator.of(context).pushNamed(ProductDetails.routeName,arguments: {"ID":index , "listProduct":listPopular}),
              ),
              Positioned(
                right: 10,
                top: 8,
                child: Icon(Entypo.star,color: Colors.grey.shade300,),
              ),
              Positioned(
                right: 10,
                top: 8,
                child: Icon(Entypo.star_outlined,color: Colors.white,),
              ),
              Positioned(
                right: 12,
                bottom: 32,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(5)
                  ),

                  child: Text("\$ ${listPopular[index].price}",style: TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor,),),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
             padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(listPopular[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),maxLines: 1,),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Text(listPopular[index].description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15 ,color: Colors.grey[800]),maxLines: 2,overflow: TextOverflow.fade,)),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(MaterialCommunityIcons.cart_plus,color: Colors.black,size: 25,),
                        ),
                        onTap: (){},
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
