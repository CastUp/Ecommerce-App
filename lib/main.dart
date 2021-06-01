import 'package:ecommerce/consts/theme_data.dart';
import 'package:ecommerce/inner_screens/brands_navigation_rail.dart';
import 'package:ecommerce/inner_screens/brands_rail_widget.dart';
import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/screens/bottom_bar.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/feeds.dart';
import 'package:ecommerce/screens/wishlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
      ],
      builder: (_, child) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> getCurrentAppTheme(BuildContext context) async{
    Provider.of<DarkThemeProvider>(context,listen: false).darkTheme = await Provider.of<DarkThemeProvider>(context,listen: false).darkThemePreferences.getDarkTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<DarkThemeProvider>(
      builder: (_ , provider , child)
      => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(provider.darkTheme, context),
          routes: {
            BrandNavigationRailScreen.routeName : (_)=>BrandNavigationRailScreen(),
            Cart.routeName : (_)=> Cart(),
            Feeds.routeName : (_)=> Feeds(),
            WishList.routeName : (_)=> WishList(),
            ProductDetails.routeName : (_)=> ProductDetails(),
          },
          home: BottomBarScreen(),
      ),
    );
  }
}
