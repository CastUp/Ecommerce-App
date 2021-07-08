import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/theme_data.dart';
import 'package:ecommerce/inner_screens/brands_navigation_rail.dart';
import 'package:ecommerce/inner_screens/categoriesFeeds.dart';
import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/inner_screens/upload_product_form.dart';
import 'package:ecommerce/provider/Auth_Provider.dart';
import 'package:ecommerce/provider/Cart_Provider.dart';
import 'package:ecommerce/provider/FavsProvider.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:ecommerce/screens/MainScreens.dart';
import 'package:ecommerce/screens/auth/login.dart';
import 'package:ecommerce/screens/auth/sign_up.dart';
import 'package:ecommerce/screens/bottom_bar.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/feeds.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/landing_page.dart';
import 'package:ecommerce/screens/wishlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (context)=> Products()),
        ChangeNotifierProvider(create: (context)=> CartProvider()),
        ChangeNotifierProvider(create: (context)=> FavsProvider()),
        ChangeNotifierProvider(create: (context)=> AuthProvider()),
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

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.dark,statusBarColor: Colors.transparent));
    return Consumer<DarkThemeProvider>(
      builder: (_ , provider , child)
      => MaterialApp(
          debugShowCheckedModeBanner: false,
          //builder: DevicePreview.appBuilder,
          theme: Styles.themeData(provider.darkTheme, context),
          routes: {
            BrandNavigationRailScreen.routeName : (_)=>BrandNavigationRailScreen(),
            Cart.routeName : (_)=> Cart(),
            Feeds.routeName : (_)=> Feeds(),
            WishList.routeName : (_)=> WishList(),
            ProductDetails.routeName : (_)=> ProductDetails(),
            CategoriesFeeds.routeName : (_)=>CategoriesFeeds(),
            LoginScreen.routeName : (_)=> LoginScreen(),
            SignUpScreen.routeName : (_)=> SignUpScreen(),
            UploadProductForm.routeName : (_)=> UploadProductForm(),
          },
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context , snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(color: Colors.amber,),
                      ),
                );
              }
              else if(snapshot.connectionState == ConnectionState.active ){
                return snapshot.hasData ? MainScreens() : LandingPage();
              }
            },
          ),
      ),
    );
  }
}
