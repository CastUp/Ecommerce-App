import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/inner_screens/brands_navigation_rail.dart';
import 'package:ecommerce/inner_screens/categoriesFeeds.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:ecommerce/screens/feeds.dart';
import 'package:ecommerce/widgets/backLayer.dart';
import 'package:ecommerce/widgets/category.dart';
import 'package:ecommerce/widgets/popular_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  List<String> _carouselIcons = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  List _brandImages = [
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/Dell.jpg',
    'assets/images/hm.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/Huawei.jpg',
  ];

  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath': 'assets/images/CatClothes.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/images/CatShoes.jpg',
    },
    {
      'categoryName': 'Beauty&Health',
      'categoryImagesPath': 'assets/images/CatBeauty.jpg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath': 'assets/images/CatFurniture.jpg',
    },
    {
      'categoryName': 'Watches',
      'categoryImagesPath': 'assets/images/CatWatches.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: BackdropAppBar(
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 5,
          backgroundColor: Colors.indigo,
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  ColorsConsts.starterColor,
                  ColorsConsts.endColor,
                ])),
          ),
          actions: [
            IconButton(
              iconSize: 17,
              padding: EdgeInsets.all(5),
              icon: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 17,
                  backgroundImage:
                  NetworkImage("https://m.3bir.net/files/33420.jpg"),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
        headerHeight: MediaQuery.of(context).size.height * .28,
        frontLayerBorderRadius: BorderRadius.circular(0),
        frontLayer: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .30,
                  child: Carousel(
                    boxFit: BoxFit.fill,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 5.0,
                    dotIncreasedColor: Colors.purple,
                    dotBgColor: Colors.black.withOpacity(0.2),
                    dotPosition: DotPosition.bottomCenter,
                    dotSpacing: 15,
                    showIndicator: true,
                    indicatorBgPadding: 8.0,
                    images: [
                      ..._carouselIcons.map((e) => Image.asset(e, fit: BoxFit.fill,)),
                    ].toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: Text(
                    "Catigories",
                    style: TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*.25,
                  child: ListView.builder(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_,index)
                      => InkWell(
                        borderRadius: BorderRadius.circular(5),
                        child: CategoryWidget(index:index,categories: categories,),
                        onTap: ()=>Navigator.of(context).pushNamed(CategoriesFeeds.routeName,arguments: {"categoryName":categories[index]["categoryName"]}),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Popular Brands",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Spacer(),
                      InkWell(
                        child: Text(
                          "View all..",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height * .28,
                  child: Swiper(
                    itemCount: _brandImages.length,
                    autoplay: true,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemBuilder: (_, index)
                    =>ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.blueGrey,
                        child: Image.asset(_brandImages[index], fit: BoxFit.fill,),
                      ),
                    ),
                    onTap: (index) => Navigator.of(context).pushNamed(BrandNavigationRailScreen.routeName,arguments: {"ID":index}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Popular Products",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Spacer(),
                      InkWell(
                        child: Text(
                          "View all..",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                        onTap: ()=> Navigator.of(context).pushNamed(Feeds.routeName, arguments: "popular"),
                      ),
                    ],
                  ),
                ),
                Consumer<Products>(
                  builder: (contexts , value , child)
                  =>Container(
                    height: MediaQuery.of(context).size.height*.43,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_,spase)
                      => SizedBox(width: 5,),
                      itemCount:value.popularProduct.length,
                      itemBuilder: (_,index)
                      => PopularProduct(index: index,listPopular: value.popularProduct,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backLayer: BackLayerMenu(),
      ),
    );
  }
}
