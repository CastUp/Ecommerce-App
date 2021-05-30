import 'package:ecommerce/consts/colors.dart';
import 'package:flutter/material.dart';

class WishlistFull extends StatefulWidget {
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        child: Image.network('https://abong.com.bd/public//admin/media/2020/03/yellow_mesh_men_sport_sneaker_shoesjpeg_20200307141459.jpeg')
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
                            'title',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "\$ 16",
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
        positionedRemove(),
      ],
    );
  }

  Widget positionedRemove() {
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
          onPressed: (){},
        )
      ),
    );
  }
}
