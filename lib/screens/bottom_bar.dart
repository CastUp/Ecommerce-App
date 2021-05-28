import 'package:ecommerce/consts/myIcons.dart';
import 'package:ecommerce/screens/feeds.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/search.dart';
import 'package:ecommerce/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'cart.dart';

class BottomBarScreen extends StatefulWidget {

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  List<String> pages = ["Home", "Feeds", "Search","Cart","User Info"];
  List<Map<String , Object>> _pages ;
  int _selectedPageIndex = 0 ;

  @override
  void initState() {
    _pages = [
      {"page" : Home()    },
      {"page" : Feeds()   },
      {"page" : Search()  },
      {"page" : Cart()    },
      {"page" : UserInfo()},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: MediaQuery.of(context).size.height * .09,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.purple,
                  width: 0.50
                )
              ),
            ),
            child: BottomNavigationBar(
              onTap: (index)=> setState(()=> _selectedPageIndex = index),
              currentIndex: _selectedPageIndex,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.black45,
              selectedItemColor: Colors.purple,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(IconsData.HOME,color: Theme.of(context).textSelectionTheme.selectionColor,),
                    label: "Home"
                  ),
                BottomNavigationBarItem(
                    icon: Icon(IconsData.RSS,color: Theme.of(context).textSelectionTheme.selectionColor,),
                    label: "Feeds"
                ),
                BottomNavigationBarItem(
                    activeIcon: null,
                    icon: Icon(null),
                    label: "Search",
                ),
                BottomNavigationBarItem(
                    icon: Icon(IconsData.BAG,color: Theme.of(context).textSelectionTheme.selectionColor,),
                    label: "Shopping"
                ),
                BottomNavigationBarItem(
                    icon: Icon(IconsData.USRE,color: Theme.of(context).textSelectionTheme.selectionColor,),
                    label: "User",
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          highlightElevation: 10,
          elevation: 4,
          splashColor: Colors.grey,
          child: Icon(IconsData.SEARCH),
          onPressed: ()=> setState(()=> _selectedPageIndex = 2),
        ),
      ),
    );
  }


}
