import 'package:ecommerce/models/cart_atrr.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CartProvider with ChangeNotifier{

  List<CartAttr>_cartItems = [] ;

  List<CartAttr> get listCartItems {

    return _cartItems;
  }

  double get totalAmount{

    var totalAmount = 0.0;

    _cartItems.forEach((element) {
      double amountItem = element.price * element.quantity ;
      totalAmount += amountItem;
    });
    return totalAmount;
  }

  void addProductToCart(BuildContext context , {String productId , double price , String title , String imageUrl}){

    int index = _cartItems.indexWhere((element) => element.id.contains(productId));

    if(index == -1)
        _cartItems.add(CartAttr(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ));
    else
      _cartItems.removeAt(index);

    notifyListeners();
  }

  void removeItem({int index}){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void removelistItems(){
    _cartItems.clear();
    notifyListeners();
  }

  void quantityNum ({int index , String state}){

   state == "-" ? _cartItems[index].quantity > 1 ? _cartItems[index].quantity--: null
       : _cartItems[index].quantity++;
    totalAmount;
    notifyListeners();
  }

  bool ID (String itemId){

    _cartItems.forEach((element) {
      if(element.id.contains(itemId))
          return true;
      else
        return false;
    });

  }


}
