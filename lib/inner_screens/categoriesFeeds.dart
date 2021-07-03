
import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:ecommerce/widgets/feeds_product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesFeeds extends StatelessWidget {
  static const routeName = '/categories_feeds';

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<Products>(context);
    Map<String , dynamic > categoryMap = ModalRoute.of(context).settings.arguments as Map ;
    String categoryName = categoryMap["categoryName"].toString();

    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 25),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 250 /400,
        shrinkWrap: true,
        reverse: true,
        children: List.generate(productProvider.findByCategory(categoryName).length, (index) => InkWell(
          child: FeedProducts(
            index: index,
            listProduct: productProvider.findByCategory(categoryName),
          ),
          onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,arguments: {"ID":index , "listProduct":Provider.of<Products>(context,listen: false).findByCategory(categoryName)}),
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
