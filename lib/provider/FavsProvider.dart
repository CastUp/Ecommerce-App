import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/models/Favs_Attr.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FavsProvider with ChangeNotifier{

  List<FavsAttr>_favsItems = [] ;

  List<FavsAttr> get listFavsItems {

    return _favsItems;
  }

  double get totalAmount{

    var totalAmount = 0.0;
    _favsItems.forEach((element) {
      totalAmount += element.price;
    });
    return totalAmount;
  }

  void addProductToFavs(BuildContext context , {String productId , double price , String title , String imageUrl}){

    int index = _favsItems.indexWhere((element) => element.id.contains(productId));

    if(index == -1)
      _favsItems.add(FavsAttr(
        id: productId,
        title: title,
        price: price,
        imageUrl: imageUrl,
      ));
    else
      Toast.show("تم الاضافه من قبل", context);
    notifyListeners();
  }

  void removeItem({int index}){
    _favsItems.removeAt(index);
    notifyListeners();
  }

  void removelistItems(){
    _favsItems.clear();
    notifyListeners();
  }


}