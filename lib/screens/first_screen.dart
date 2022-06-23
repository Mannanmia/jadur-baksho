import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jadroo/productShow/product_display_section.dart';
import 'package:jadroo/provider/home_provider.dart';
import 'package:jadroo/screens/profile_screen.dart';
import 'package:provider/provider.dart';

import '../category_opt.dart';
import 'category_screen.dart';
import 'chat_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final iconList = <IconData>[
  Icons.home_sharp,
  Icons.apps_sharp,
  Icons.chat_outlined,
  Icons.account_circle_outlined,
];
final screens=[
  HomeScreen(),
  CategoryScreen(),
  ChatScreen(),
  ProfileScreen(),
];
var  _bottomNavIndex=0;
var scaffoldkey =GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context,listen: false).initializeHomeModel();
   double scheight=MediaQuery.of(context).size.height;
    double scWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldkey,
      appBar:  AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            scaffoldkey.currentState?.openDrawer();
          },
          icon: Icon(Icons.dehaze_rounded,color: Colors.black54,),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            width:scWidth*.28 ,
            height: scheight*.08,
            child: Image.asset("assets/image/JadrooLogo.png",fit: BoxFit.fitWidth,),
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
            icon: Icon(Icons.shopping_cart),color: Colors.black54,),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white70,
       child: ListView(
         padding: EdgeInsets.all(8),
         children: [
           Container(
             //width:scWidth*.28 ,
             child: Image.asset("assets/image/JadrooLogo.png",fit: BoxFit.fitHeight,),),
           SizedBox(
             height: 50,
             width: 150,
           ),
           drawerOption(Icons.home_sharp, "Home"),
           drawerOption(Icons.shopping_cart, "My Cart"),
           drawerOption(Icons.notification_important_outlined, "Notification"),
           drawerOption(Icons.list_alt_rounded, "My Orders"),
           drawerOption(Icons.apps_outlined, "Catagories"),
           drawerOption(Icons.wallet_giftcard_sharp, "Partners"),
           drawerOption(Icons.point_of_sale_rounded, "Become a wholesaler"),
           SizedBox(
             height: 200,
             width: 150,
           ),
           Center(child: Text("Version 1.1.1.1")),

         ],
       ),
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        elevation: 10,
        backgroundColor: Colors.white,
        child: Icon(Icons.search,color: Color(0xFF42a5f5),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        borderColor: Colors.black26,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() =>_bottomNavIndex = index ),
      ),
      body:_bottomNavIndex==0?
      SingleChildScrollView(
        child: Consumer<HomeProvider>(
          builder: (context,homeprovider,index){
          return Column(

              children: [
                Container(
                  height: scheight/6,
                  width:scWidth,
                  color: Colors.white,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.9,
                      aspectRatio: 1.0,
                      enlargeCenterPage: true,
                    ),
                    items:homeprovider.homeModel.sliderImgList
                        !.map((item) => Container(
                      width: scWidth,
                      child: Image.network(item,fit: BoxFit.cover,),
                      color: Colors.white,
                    ))
                        .toList(),
                  ),
                ),
              Container(
                  height: scheight*.33,
                  width: scWidth,
                  child: GridView.count(
                    crossAxisCount: 5,
                    children: [
                      for(int i=0;i<homeprovider.homeModel.categoryList!.length;i++)
                      CategoriesOpt(optImageLink:homeprovider.homeModel.categoryList![i].imglink.toString(),
                    optName: homeprovider.homeModel.categoryList![i].itemName.toString()),
                    ],
                  ),
                ),
                ProductDisplay(productDisplayName:"NEW ARRIVALS"),
                SizedBox(
                  height: 10,
                ),
                ProductDisplay(productDisplayName:" Flash sale"),

              ],
            );
          },
        )
      )
          :_bottomNavIndex==1?
      CategoryScreen()
          :_bottomNavIndex==2?
      ChatScreen()
          :
      ProfileScreen(),
    );
  }
}

ListTile drawerOption(IconData optIcon,String optname){
  return ListTile(
    title: Text(optname),
    leading: Icon(optIcon),
  );
}