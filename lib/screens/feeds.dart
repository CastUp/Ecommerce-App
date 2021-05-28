import 'package:ecommerce/widgets/feeds_product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StaggeredGridView.countBuilder(
        padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 25),
        crossAxisCount:6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        staggeredTileBuilder: (int count)
        => StaggeredTile.count(3, count.isEven? 4: 5),
        itemCount: 20,
        itemBuilder: (_,index)
        => FeedProducts(),
      ),
    );
  }
}
