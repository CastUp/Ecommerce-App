
import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/myIcons.dart';
import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/provider/Cart_Provider.dart';
import 'package:ecommerce/provider/FavsProvider.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class FeedDialog extends StatelessWidget {
  final int index;
  final List<Product> listProduct ;
  const FeedDialog({this.index, this.listProduct});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Image.network(this.listProduct[index].imageUrl),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: dialogContent(context, 0, (){
                      Provider.of<FavsProvider>(context,listen: false).addProductToFavs(context,
                        imageUrl: this.listProduct[index].imageUrl,price: this.listProduct[index].price,
                        title: this.listProduct[index].title,productId: this.listProduct[index].id);
                      Navigator.canPop(context)? Navigator.pop(context): null ;
                    }),
                  ),
                  Flexible(
                    child: dialogContent(context, 1, (){
                       Navigator.of(context).popAndPushNamed(ProductDetails.routeName,arguments: {"ID":this.index , "listProduct":this.listProduct});
                    }),
                  ),
                  Flexible(
                    child: dialogContent(context, 2, (){
                      Provider.of<CartProvider>(context ,listen: false).addProductToCart(context,
                    productId: this.listProduct[index].id,title: this.listProduct[index].title,price: this.listProduct[index].price,
                    imageUrl: this.listProduct[index].imageUrl);
                      Navigator.canPop(context)? Navigator.pop(context): null ;
                    }),
                  ),
                ]),
          ),

          /************close****************/
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.3),
                shape: BoxShape.circle),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.grey,
                onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.close, size: 28, color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget dialogContent(BuildContext context, int index, Function fct) {
    List<IconData> _dialogIcons = [
      Icons.favorite,
      Feather.eye,
      MyAppIcons.CART,
      MyAppIcons.TRASH
    ];

    List<String> _texts = [
      'Add to wishlist',
      'View product',
      'Add to cart',
    ];
    List<Color> _colors = [Colors.red ,Colors.red,Colors.red,Colors.red];

    final themeChange = Provider.of<DarkThemeProvider>(context);
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: fct,
          splashColor: Colors.grey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    // inkwell color
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          _dialogIcons[index],
                          color: _colors[index],
                          size: 25,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FittedBox(
                    child: Text(
                      _texts[index],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        //  fontSize: 15,
                        color: themeChange.darkTheme
                            ? Theme.of(context).disabledColor
                            : ColorsConsts.subTitle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
