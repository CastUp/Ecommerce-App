import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/provider/FavsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistFull extends StatefulWidget {
  
  final int index ;

  WishlistFull({@required this.index});
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavsProvider>(
      builder:(context , value , child)=> Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: 30,bottom: 10),
            child: Material(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(4.0),
              elevation: 3.0,
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(value.listFavsItems[widget.index].imageUrl)
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              value.listFavsItems[widget.index].title,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "\$${value.listFavsItems[widget.index].price.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: (){},
              ),
            ),
          ),
          positionedRemove(context ,index: widget.index),
        ],
      ),
    );
  }

  Widget positionedRemove(BuildContext context ,{int index}) {
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: TextButton(
          child:  Icon(Icons.clear, color: Colors.white,),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
            backgroundColor: MaterialStateProperty.all<Color>(ColorsConsts.favColor),
          ),
          onPressed:()=> Provider.of<FavsProvider>(context,listen: false).removeItem(index: index),
        )
      ),
    );
  }
}
