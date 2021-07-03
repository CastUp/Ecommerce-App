import 'package:badges/badges.dart';
import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/myIcons.dart';
import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/provider/Cart_Provider.dart';
import 'package:ecommerce/provider/FavsProvider.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/wishlist.dart';
import 'package:ecommerce/widgets/feeds_product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/feeds';

  @override
  Widget build(BuildContext context) {

    String page = ModalRoute.of(context).settings.arguments as String;

    final productProvider = Provider.of<Products>(context);

    List<Product> listProducts = productProvider.products;

    if(page == "popular")
         listProducts = productProvider.popularProduct;


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(.8),
          elevation: 0,
          title: Text(
            "Feeds",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Badge(
              badgeColor: ColorsConsts.favBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              elevation: 3,
              animationDuration: Duration(seconds: 3),
              badgeContent: Text(Provider.of<FavsProvider>(context).listFavsItems.length.toString() ,style: TextStyle(color: Colors.white),),
              position: BadgePosition(top: 5,end: 7),
              child: IconButton(
                icon: Icon(
                  MyAppIcons.WISHLIST,
                  color: Colors.red.shade600,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(WishList.routeName);
                },
              ),
            ),
            Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              elevation: 3,
              animationDuration: Duration(seconds: 3),
              badgeContent: Text(Provider.of<CartProvider>(context).listCartItems.length.toString() ,style: TextStyle(color: Colors.white),),
              position: BadgePosition(top: 5,end: 7),
              child: IconButton(
                icon: Icon(
                  MyAppIcons.CART,
                  color: ColorsConsts.cartColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(Cart.routeName);
                },
              ),
            ),
          ]),
      body: GridView.count(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 25),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 250 /400,
        shrinkWrap: true,
        reverse: true,
        children: List.generate(listProducts.length, (index) => InkWell(
            child: FeedProducts(
              index: index,
              listProduct: listProducts,
            ),
            onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,arguments: {"ID":index , "listProduct":listProducts}),
          ),
        ),
      ),
    );
  }
}

// StaggeredGridView.countBuilder(
// padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 25),
// crossAxisCount: 6,
// mainAxisSpacing: 8,
// crossAxisSpacing: 8,
// staggeredTileBuilder: (int count) =>
// StaggeredTile.count(3, count.isEven ? 4 : 5),
// itemCount: _products.length,
// itemBuilder: (_, index) => InkWell(
// child: FeedProducts(index: index,listProduct: _products,),
// onTap: () => Navigator.pushNamed(context, ProductDetails.routeName),
// ),
// ),
