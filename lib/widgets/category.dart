import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final int index;
  final List categories ;
  CategoryWidget({this.index , this.categories});

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height*.23,
          width: MediaQuery.of(context).size.width*.40,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
                image: AssetImage(widget.categories[widget.index]['categoryImagesPath']),
                fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 14,
          left: 5,
          right: 5,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
              color: Theme.of(context).backgroundColor.withOpacity(.70),
            ),

            child: Text(
              widget.categories[widget.index]['categoryName'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textSelectionTheme.selectionColor),
            ),
          ),
        ),
      ],
    );
  }
}
