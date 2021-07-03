import 'package:ecommerce/provider/FavsProvider.dart';
import 'package:ecommerce/widgets/cart_empty.dart';
import 'package:ecommerce/widgets/cart_full.dart';
import 'package:ecommerce/widgets/wish_list_empty.dart';
import 'package:ecommerce/widgets/wishlist_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  static const routeName = '/wish_list';

  @override
  Widget build(BuildContext context) {
    return Consumer<FavsProvider>(
      builder: (context , value , child)
          => value.listFavsItems.isEmpty ?
              Scaffold(body: WishListEmpty(),)
              :Scaffold(
                   appBar: AppBar(
                             title: Text("Items " + value.listFavsItems.length.toString(),
                                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),),
                             actions: [
                             IconButton(
                                 padding: EdgeInsets.symmetric(horizontal: 10),
                                 icon: Icon(Icons.delete),
                                 onPressed: ()=> value.removelistItems(),
                                 ),
                         ],
                      ),
                   body: Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: ListView.builder(
                                itemCount: value.listFavsItems.length,
                                itemBuilder: (_, index) => WishlistFull(index: index,),
              ),
            ),
          ),
    );
  }
}
