import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/feeds.dart';
import 'package:flutter/material.dart';

class BrandsNavigationRail extends StatelessWidget {

  final List<Product> listBrand;
  final int index ;
  BrandsNavigationRail({@required this.listBrand, @required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).pushNamed(ProductDetails.routeName , arguments: {"ID":index , "listProduct": listBrand}),
      child: Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        margin: EdgeInsets.only(right: 20 , top: 18,bottom: 5),
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          minHeight: MediaQuery.of(context).size.height*.20 , maxHeight: MediaQuery.of(context).size.height*.24
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  image: DecorationImage(
                      image: NetworkImage(listBrand[index].imageUrl,), fit: BoxFit.fitWidth),
                  border: Border.all(width: 2,color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(.30),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 2.0)
                  ],
                ),
              ),
            ),
            FittedBox(
              child: Container(
                width: MediaQuery.of(context).size.width*.40,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(7.0), topRight: Radius.circular(7.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(listBrand[index].title,
                      maxLines: 2, style: TextStyle(fontWeight: FontWeight.w700, color: Theme.of(context).textSelectionTheme.selectionColor),),
                    SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text('\$${listBrand[index].price}', maxLines: 1,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text('${listBrand[index].productCategoryName}', style: TextStyle(color: Colors.grey, fontSize: 18.0),maxLines: 1,),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
