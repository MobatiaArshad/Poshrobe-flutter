import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/rendering.dart';
import 'package:poshrob/Resources/AppColors.dart';
import 'package:poshrob/backend/backend_class.dart';
import 'package:poshrob/backend/backend_data.dart';

import '../sizes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var homeArray = [
    'Joey Tribbiani',
    'Chandler Bing',
    'Ross Geller',
    'Rachel Green',
    'Pheobe Buffe',
    'Monica Geller'
  ];


  List<Tab> tabs=[];
  List<Header> headers=[];

  late Future _future;
  String selectedCategory="475";

  Future _getHomeContents() async {
    try {
      await Future.wait([
        getHeaderCategories().then(
                (value) {
                  value.forEach((element) {
                    tabs.add(Tab(text: element.name, ));
                    headers.add(element);
                  });

                }
        ),
      ]);
      return tabs;
    } catch (e) {
      rethrow;
    }
  }


  @override
  void initState() {
    _future = _getHomeContents();
    super.initState();
  }

  @override
  void dispose() {
    tabs.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image(
                    image: AssetImage('images/hamburger_ico.png'),
                  ),
                ),
                Image(
                  image: AssetImage('images/app_logo.png'),
                  width: 120,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Image(image: AssetImage('images/avatar_ico.png')),
                )
              ],
            ),
          ),
          FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Flexible(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                        //_topbar(),
                        _tabLayouts(),
                        _tabProducts(),
                        _categoryWidget(),
                        _setFeaturedProduct(),
                        _setRecommendedList()
                      ],
                    )
                );
              }
              return SizedBox(
                  height: screenHeight(context, mulBy: 0.3),
                  child: Center(child: CircularProgressIndicator(
                    color: Color(AppColors.commonOrange),
                  )));
            },
          ),

        ],
      ),
    );
  }

  Widget _topbar() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Hi Jhon Doe',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What are you looking for today?',
                style: TextStyle(color: Colors.black, fontSize: 27),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Search Items',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(AppColors.grey), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(AppColors.grey), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabLayouts() {
    return DefaultTabController(
      length: tabs.length,
      child: TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: (no){
          selectedCategory= headers[no].id;
        },
        indicator: BubbleTabIndicator(
          indicatorHeight: 25.0,
          indicatorColor: Color(AppColors.commonOrange),
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: tabs,),
    );
  }

  Widget _tabProducts() {
    return Container(
      height: screenHeight(context, mulBy: 0.6),
      width: screenWidth(context),
      color: Colors.redAccent,
      child: FutureBuilder(
        future: getCategoryProducts(selectedCategory),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount:  2 ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductDetails(
                          product: snapshot.data[index],
                        )));
                  },

                  child: Card(
                    margin: (index%2!=0)?const EdgeInsets.only(right: 10, left: 5, bottom: 10):const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                    color: Colors.white,
                    elevation: 1,
                    child: Column(
                      children: [
                        SizedBox(
                            height: screenHeight(context, mulBy: 0.25),
                            child: Image.network(snapshot.data[index].image, fit: BoxFit.cover,)),
                        Text(
                          snapshot.data[index].name,
                          style: const TextStyle(
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.01),
                        ),
                        Text(
                          snapshot.data[index].bottleType,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox(
              height: screenHeight(context, mulBy: 0.3),
              child: const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.all(1),
      width: double.infinity,
      height:180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeArray.length,
          itemBuilder: (BuildContext context, int index) {
        return Container(
          child: setHomeBanner(index),
        );
      }),
    );
  }

  Widget setHomeBanner(int index) {
    return Container(
      width: 326,
      height: 178,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/home_banner.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10),
                    child: SizedBox(
                      width: 185.0,
                      child: Text(
                        "Zardozi And Thread Embroidery Imported Green Sherwani",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text('Shop Now',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(CupertinoIcons.arrow_right,color: Colors.white,),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Image(image: AssetImage('images/sher_img.png'))
            ],
          ),
        ),
      ),

    );
  }

  Widget _setFeaturedProduct() {
    return Container(
      child: SizedBox(
        height: 320,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Products',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),

                  Text('See All',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 16)),
                ],
              ),
            ),

            Flexible(
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 10.0),
                  child: ListView.builder(
                    // make sure to add the following lines:
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                      itemCount: homeArray.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: _featureListData(index),
                        );
                      }
                    // the rest of your list view code
                  ),
                ) // ListView
            )

          ],
        ),
      ),

    );
  }

  Widget _featureListData(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 155,
        height: 248,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('images/feature_img.png'),
              width: 155,
              height: 173,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text('Rs 2,999',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text('/ Rental',style: TextStyle(
                      color: Colors.grey,
                        fontSize: 13),),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  Text('Rs 28,999',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text('/ Sale',style: TextStyle(
                      color: Colors.grey,
                        fontSize: 13),),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 185.0,
                child: Text(
                  "Embroidered Pista Green Sherwani",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(color: Colors.black87, fontSize: 12.0),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _setRecommendedList() {
    return Container(
      child: SizedBox(
        height: 320,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recommended Products',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text('See All',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
          ),

          Flexible(
              child:
              Padding(
                padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 10.0),
                child: ListView.builder(
                  // make sure to add the following lines:
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: homeArray.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: _recommendedListData(index),
                      );
                    }
                  // the rest of your list view code
                ),
              ) // ListView
          )

        ]),
      ),
    );
  }

  Widget _recommendedListData(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 155,
        height: 248,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('images/recomended_img.png'),
              width: 155,
              height: 173,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text('Rs 2,999',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text('/ Rental',style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13),),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  Text('Rs 28,999',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text('/ Sale',style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13),),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 185.0,
                child: Text(
                  "Embroidered Pista Green Sherwani",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(color: Colors.black87, fontSize: 12.0),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

