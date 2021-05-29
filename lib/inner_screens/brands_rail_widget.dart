import 'package:flutter/material.dart';

class BrandsNavigationRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
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
                      image: NetworkImage('http://arabic.worldshopwarehouse.com/img/p/1/76632-large_default.jpg',), fit: BoxFit.fitWidth),
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
                    Text('title',
                      maxLines: 2, style: TextStyle(fontWeight: FontWeight.w700, color: Theme.of(context).textSelectionTheme.selectionColor),),
                    SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text('US 16 \$', maxLines: 1,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text('CatergoryName', style: TextStyle(color: Colors.grey, fontSize: 18.0),maxLines: 1,),
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
