import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.09),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/empty-wishlist.png"),
                      fit: BoxFit.fill)),
            ),
            Text(
              "Your Wish list Is Empty",
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Explore more and short list some items",
              style: TextStyle(
                color: context.watch<DarkThemeProvider>().darkTheme ? Colors.red.shade400: ColorsConsts.subTitle ,
                fontSize: 26,),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: MediaQuery.of(context).size.height * 0.08,),
              width: double.infinity,
              child: TextButton(
                onPressed: (){},
                child: Text("Add a wish".toUpperCase(), style: TextStyle(color: Colors.black,fontSize: 22 , fontWeight: FontWeight.bold),),
                style:ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(3),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade400),
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 14)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(width: 1 , color: Theme.of(context).textSelectionTheme.selectionColor)
                        )
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
