import 'package:badges/badges.dart';
import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/myIcons.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/wishlist.dart';
import 'package:ecommerce/widgets/cart_full.dart';
import 'package:ecommerce/widgets/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {

  static const routeName = '/ProductDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            foregroundDecoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU',),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.save, size: 23, color: Colors.white,),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.share, size: 23, color: Colors.white,),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('title', maxLines: 2, style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600,),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text('US \$ 15', style: TextStyle(color: themeState.darkTheme ? Theme.of(context).disabledColor : ColorsConsts.subTitle,
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0),
                        ),
                      ),
                      const SizedBox(
                          height: 3.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(thickness: 1, color: Colors.grey, height: 1,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21.0,
                            color: themeState.darkTheme
                                ? Theme.of(context).disabledColor
                                : ColorsConsts.subTitle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _details(themeState.darkTheme, 'Brand: ', 'BrandName'),
                      _details(themeState.darkTheme, 'Quantity: ', '12 Left'),
                      _details(themeState.darkTheme, 'Category: ', 'Cat Name'),
                      _details(themeState.darkTheme, 'Popularity: ', 'Popular'),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 10.0),
                            Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'No reviews yet',
                            style: TextStyle(
                                color: Theme.of(context).textSelectionColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 21.0),
                          ),),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Be the first review!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : ColorsConsts.subTitle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Suggested products:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (_,index)
                    => Container(
                      child: InkWell(
                          child: FeedProducts(width: MediaQuery.of(context).size.width*.45),
                        onTap: ()=> Navigator.of(context).pushReplacementNamed(ProductDetails.routeName),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
                backgroundColor: Colors.blueGrey.shade200,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "DETAIL",
                  style:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      MyAppIcons.WISHLIST,
                      color: ColorsConsts.favColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(WishList.routeName);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      MyAppIcons.CART,
                      color: ColorsConsts.cartColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Cart.routeName);
                    },
                  ),
                ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                      color: Colors.redAccent.shade400,
                      onPressed: () {},
                      child: Text(
                        'Add to Cart'.toUpperCase(),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Buy now'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).textSelectionColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.green.shade700,
                            size: 19,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: themeState.darkTheme
                        ? Theme.of(context).disabledColor
                        : ColorsConsts.subTitle,
                    height: 50,
                    child: InkWell(
                      splashColor: ColorsConsts.favColor,
                      onTap: () {},
                      child: Center(
                        child: Icon(
                          MyAppIcons.WISHLIST,
                          color: ColorsConsts.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ],
      ),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 21.0),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
              color: themeState
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
            ),
          ),
        ],
      ),
    );
  }


}
