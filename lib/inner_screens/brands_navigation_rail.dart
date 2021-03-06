import 'package:ecommerce/inner_screens/brands_rail_widget.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandNavigationRailScreen extends StatefulWidget {
  static const routeName = '/brands_navigation_rail';

  @override
  _BrandNavigationRailScreenState createState() => _BrandNavigationRailScreenState();
}

class _BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;
  String routeArgs;
  String brand;

  @override
  void didChangeDependencies() {

    Map<String, int> ID = ModalRoute.of(context).settings.arguments as Map<String, int>;
    _selectedIndex = ID["ID"];

    if (_selectedIndex == 0) {
      setState(() {
        brand = 'Addidas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brand = 'Apple';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brand = 'Dell';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brand = 'H&M';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brand = 'Nike';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brand = 'Samesong';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brand = 'Huawei';
      });
    }
    if (_selectedIndex == 7) {
      setState(() {
        brand = 'All';
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (conx , constraints)
            => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    minWidth: MediaQuery.of(context).size.width*.15,
                    groupAlignment: 1.0,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index){
                      setState(() {
                        _selectedIndex = index ;
                        if (_selectedIndex == 0) {
                          setState(() {
                            brand = 'Addidas';
                          });
                        }
                        if (_selectedIndex == 1) {
                          setState(() {
                            brand = 'Apple';
                          });
                        }
                        if (_selectedIndex == 2) {
                          setState(() {
                            brand = 'Dell';
                          });
                        }
                        if (_selectedIndex == 3) {
                          setState(() {
                            brand = 'H&M';
                          });
                        }
                        if (_selectedIndex == 4) {
                          setState(() {
                            brand = 'Nike';
                          });
                        }
                        if (_selectedIndex == 5) {
                          setState(() {
                            brand = 'Samesong';
                          });
                        }
                        if (_selectedIndex == 6) {
                          setState(() {
                            brand = 'Huawei';
                          });
                        }
                        if (_selectedIndex == 7) {
                          setState(() {
                            brand = 'All';
                          });
                        }
                        print(brand);
                      });
                    },
                    labelType: NavigationRailLabelType.all,
                    leading: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Center(
                          child: CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage("https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"),
                          ),
                        ),
                        SizedBox(height: 80,),
                      ],
                    ),
                    selectedLabelTextStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      letterSpacing: 1,
                      decorationThickness: 2.5,
                    ),
                    unselectedLabelTextStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.8,
                    ),
                    destinations: <NavigationRailDestination>[
                      buildRotatedTextRailDestination('Addidas', padding),
                      buildRotatedTextRailDestination("Apple", padding),
                      buildRotatedTextRailDestination("Dell", padding),
                      buildRotatedTextRailDestination("H&M", padding),
                      buildRotatedTextRailDestination("Nike", padding),
                      buildRotatedTextRailDestination("Samesong", padding),
                      buildRotatedTextRailDestination("Huawei", padding),
                      buildRotatedTextRailDestination("All", padding),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ContentSpace(context, brand),
        ],
      ),
    );
  }

  NavigationRailDestination buildRotatedTextRailDestination(String text , double pading){

    return NavigationRailDestination(
      icon: SizedBox.shrink(),
      label: Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: RotatedBox(
                     quarterTurns: -1,
                     child: Text(text),
            )
      ),
    );
  }
}

class ContentSpace extends StatelessWidget{

  final String brand;
  ContentSpace(BuildContext context, this.brand);

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Products>(context).findByBrand(this.brand.toLowerCase());

    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: productData.length,
            itemBuilder: (_,index)
            => BrandsNavigationRail(index: index,listBrand: productData,),
          ),
        ),
      ),
    );
  }


}