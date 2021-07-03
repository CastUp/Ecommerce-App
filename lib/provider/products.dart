import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier{

  List<Product> _products = [
    new Product(
        id: "samesong1",
        title: "Mobile SameSong",
        price: 2089.52,
        brand: "Samesong",
        description: "This is the most best mobile in Market",
        productCategoryName: "Samesong",
        imageUrl:
        "https://mobizil.com/wp-content/uploads/2020/02/Samsung-Galaxy-S20.jpg",
        quantity: 1002,
        isPopular: true,
        isFavorite: false),
    new Product(
        id: "samesong2",
        title: "Mobile SameSong",
        price: 4089.92,
        brand: "Nike",
        description: "This is the most best mobile in Market",
        productCategoryName: "Samesong",
        imageUrl:
        "https://i1.wp.com/oneegnews.com/wp-content/uploads/2020/03/%D8%B3%D8%A7%D9%85%D8%B3%D9%88%D9%86%D8%AC-Samsung-Galaxy-M11-1.jpg?resize=772%2C434&quality=75&strip=all&ssl=1",
        quantity: 1002,
        isPopular: false,
        isFavorite: false),
    new Product(
        id: "samesong3",
        title: "Mobile SameSong",
        price: 2089.52,
        brand: "Samesong",
        description: "This is the most best mobile in Market",
        productCategoryName: "Laptops",
        imageUrl:
        "https://msry.org/wp-content/uploads/d-41.png",
        quantity: 1002,
        isPopular: false,
        isFavorite: false),
    new Product(
        id: "samesong4",
        title: "Mobile SameSong",
        price: 2089.52,
        brand: "Apple",
        description: "This is the most best mobile in Market",
        productCategoryName: "Phones",
        imageUrl: "https://mobizil.com/wp-content/uploads/2020/10/Oppo-A73-2.jpg",
        quantity: 1002,
        isPopular: true,
        isFavorite: false)
  ];

  List<Product> get products => _products ;



  List<Product> findByCategory (String categoryName){

     List _categoryList = _products.where((element) => element.productCategoryName.toLowerCase().contains(categoryName.toLowerCase())).toList();

     return _categoryList ;
  }


  List<Product> findByBrand (String brandName){

    List _brandlist = brandName != "all" ? _products.where((element) => element.brand.toLowerCase().contains(brandName.toLowerCase())).toList()
        : _products ;
    return _brandlist ;
  }


  List<Product> get popularProduct => _products.where((element) => element.isPopular).toList() ;
}