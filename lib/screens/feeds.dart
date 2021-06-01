import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/widgets/feeds_product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/feeds';
  List<Product> _products = [
    new Product(
        id: "samesong1",
        title: "Mobile SameSong",
        price: 2089.52,
        brand: "Samesong",
        description: "This is the most best mobile in Market",
        productCategoryName: "Samesong",
        imageUrl:
            "https://mobizil.com/wp-content/uploads/2020/02/Samsung-Galaxy-S20.jpg",
        quantity: 1002,
        isPopular: false,
        isFavorite: false),
    new Product(
        id: "samesong2",
        title: "Mobile SameSong",
        price: 2089.52,
        brand: "Samesong",
        description: "This is the most best mobile in Market",
        productCategoryName: "Samesong",
        imageUrl:
            "https://i1.wp.com/oneegnews.com/wp-content/uploads/2020/03/%D8%B3%D8%A7%D9%85%D8%B3%D9%88%D9%86%D8%AC-Samsung-Galaxy-M11-1.jpg?resize=772%2C434&quality=75&strip=all&ssl=1",
        quantity: 1002,
        isPopular: false,
        isFavorite: false),
    new Product(
        id: "samesong2",
        title: "Mobile SameSong",
        price: 2089.52,
        brand: "Samesong",
        description: "This is the most best mobile in Market",
        productCategoryName: "Samesong",
        imageUrl:
        "https://msry.org/wp-content/uploads/d-41.png",
        quantity: 1002,
        isPopular: false,
        isFavorite: false),
    new Product(
        id: "samesong2",
        title: "Mobile SameSong",
        price: 2089.52,
        brand: "Samesong",
        description: "This is the most best mobile in Market",
        productCategoryName: "Samesong",
        imageUrl:
        "https://mobizil.com/wp-content/uploads/2020/10/Oppo-A73-2.jpg",
        quantity: 1002,
        isPopular: false,
        isFavorite: false)
  ];

  @override
  Widget build(BuildContext context) {
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
        children: List.generate(_products.length, (index) => InkWell(
            child: FeedProducts(
              index: index,
              listProduct: _products,
            ),
            onTap: () => Navigator.pushNamed(context, ProductDetails.routeName),
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
