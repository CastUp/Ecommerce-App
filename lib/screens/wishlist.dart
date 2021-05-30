import 'package:ecommerce/widgets/cart_empty.dart';
import 'package:ecommerce/widgets/cart_full.dart';
import 'package:ecommerce/widgets/wish_list_empty.dart';
import 'package:ecommerce/widgets/wishlist_full.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  static const routeName = '/wish_list';
  List wishlist = [];

  @override
  Widget build(BuildContext context) {
    return wishlist.isEmpty
        ? Scaffold(
            body: WishListEmpty(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Items Count  " + wishlist.length.toString(),
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(top: 5, left: 5),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) => WishlistFull(),
              ),
            ),
          );
  }
}
