import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  ScrollController _scrollController ;
  var top = 0.0 ;
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: MediaQuery.of(context).size.height*.28,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints){
                    top = constraints.biggest.height ;
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              ColorsConsts.starterColor,
                              ColorsConsts.endColor,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: top <= MediaQuery.of(context).size.height*.14 ? 1.0 : 0.0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: kToolbarHeight / 1.8,
                                    width: kToolbarHeight / 1.8,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage('https://m.3bir.net/files/33420.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    // 'top.toString()',
                                    'Hazem',
                                    style: TextStyle(
                                        fontSize: 20.0,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child:Image(
                            image: NetworkImage('https://i.ytimg.com/vi/v63oeuGVq8Q/hqdefault.jpg?sqp=-oaymwEZCOADEI4CSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLB8PxprCRjlOGrsQVdlx-Kf-JAn9A'),
                             fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0 , top: 15),
                      child: _User(text: "User Information"),
                    ),
                    Divider(thickness: 1,color: Colors.grey,),
                    _userListTile(title: "Email",subTitle: "Hazemibrahimabdallah@gmail.com",index: 0 ,context: context),
                    _userListTile(title: "Phone number",subTitle: "01007346101",index: 1 ,context: context),
                    _userListTile(title: "Shopping address",subTitle: "31 st eltahrer",index: 2 ,context: context),
                    _userListTile(title: "Joined date",subTitle: "21-5-2021",index: 3 ,context: context),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: _User(text: "User settings"),
                    ),
                    Divider(thickness: 1,color: Colors.grey,),
                    Consumer<DarkThemeProvider>(
                        builder:(_, provider , child)
                            => ListTileSwitch(
                              value: provider.darkTheme,
                              leading: Icon(Ionicons.md_moon),
                              onChanged: (val)=> setState(()=> provider.darkTheme = val),
                              visualDensity: VisualDensity.comfortable,
                              switchType: SwitchType.cupertino,
                              switchActiveColor: Colors.indigo,
                              switchInactiveColor: Colors.grey,
                              title: Text("Dark Theme"),
                            ),
                    ),
                    _userListTile(context: context ,index: 4,title: "Log out",subTitle: ""),
                    Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.10),)
                  ],
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      )
    );
  }

  List<IconData> _userIconTile=[
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget _userListTile({String title, String subTitle,int index, BuildContext context}){

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.yellow.shade100,
        child: ListTile(
          title: Text(title,),
          subtitle: Text(subTitle),
          leading: Icon(_userIconTile[index]),
          onTap: (){},
        ),
      ),
    );
  }

  Widget _User({String text}){

    return Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return  Positioned(
      top: top,
      right: 16.0,
      child:  Transform(
        transform:  Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child:  FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: (){},
          child:  Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }


}
