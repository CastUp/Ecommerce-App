import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:ecommerce/widgets/feeds_product.dart';
import 'package:ecommerce/widgets/searchby_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchTextController;
  final FocusNode _node = FocusNode();

  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchTextController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _node.dispose();
    _searchTextController.dispose();
  }

  List<Product> _searchList = [];

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final productsList = productsData.products;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SearchByHeader(
              stackPaddingTop: 175,
              titlePaddingTop: 50,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsConsts.title,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              stackChild: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchTextController,
                  minLines: 1,
                  focusNode: _node,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    suffixIcon: IconButton(
                      onPressed: _searchTextController.text.isEmpty
                          ? null
                          : () {
                              _searchTextController.clear();
                              _node.unfocus();
                            },
                      icon: Icon(Feather.x,
                          color: _searchTextController.text.isNotEmpty
                              ? Colors.red
                              : Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    _searchTextController.text.toLowerCase();
                    setState(() {
                       _searchList = productsData.searchQuery(value);
                    });
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _searchTextController.text.isNotEmpty && _searchList.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Icon(
                        Feather.search,
                        size: 60,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'No results found',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                : GridView.count(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 240 / 420,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: List.generate(
                        _searchTextController.text.isEmpty
                            ? productsList.length
                            : _searchList.length, (index) {
                      return ChangeNotifierProvider.value(
                        value: _searchTextController.text.isEmpty
                            ? productsList[index]
                            : _searchList[index],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: FeedProducts(listProduct: _searchTextController.text.isEmpty ? productsList : _searchList,index: index,),
                        ),
                      );
                    }),
                  ),
          ),
        ],
      ),
    );
  }
}
