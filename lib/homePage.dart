import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'homePageOpt.dart';

    class MyHomePage extends StatefulWidget {
      const MyHomePage({Key? key}) : super(key: key);

      @override
      State<MyHomePage> createState() => _MyHomePageState();
    }
final List<String> imgList=[
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo-Q90A12sSQa0u531Ph9bDtTK5FAh_jBXmg&usqp=CAU",
  "data:image/png;base64,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",
  "https://live.staticflickr.com/65535/48347413612_bd55840c0c_b.jpg",
  "https://live.staticflickr.com/65535/50382217741_3c4b6e394b_b.jpg"
];
var scaffoldkey =GlobalKey<ScaffoldState>();

    class _MyHomePageState extends State<MyHomePage> {
      @override
      Widget build(BuildContext context) {
        double scheight= MediaQuery.of(context).size.height;
        double scWidth= MediaQuery.of(context).size.width;
        return Scaffold(
          key: scaffoldkey,
            appBar: AppBar(
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
                child: Image.asset("assets/image/JadrooLogo.png",fit: BoxFit.fitHeight,),
              ),
            ),
              actions: [
                IconButton(onPressed: (){},
                    icon: Icon(Icons.shopping_cart),color: Colors.black54,),
              ],
          ),
          //drawerScrimColor: Colors.black,
          backgroundColor: Colors.white,
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
                  height: 100,
                  width: 150,
                ),
                Center(child: Text("Version 1.1.1.1")),

              ],
            ),
          ),
          body: Column(
            children: [
          Container(
            height: scheight/6,
          width: scWidth,
          color: Colors.white,
          child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 0.9,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
          ),
          items:imgList
              .map((item) => Container(
            width: scWidth,
            child: Image.network(item,fit: BoxFit.cover,),
            color: Colors.white,
          ))
              .toList(),
        ),
        ),
              Container(
                height: scheight*.4,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          HomePageOpt(optImageLink: "https://c.pxhere.com/photos/70/64/photo-15518.jpg!d",
                              optName: "Jadroo Groceries"),
                          Spacer(),
                          HomePageOpt(optImageLink: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUvFQX0nYEqQurSaWPMLI7UdKLRt9qedmPkw&usqp=CAU",
                              optName: "Home Appliance"),
                          Spacer(),
                          HomePageOpt(optImageLink: "https://freesvg.org/img/Mother-And-Child-Holding-Hands-Silhouette.png",
                              optName: "Kids & Mom"),
                          Spacer(),
                          HomePageOpt(optImageLink: "https://webapi.robi.com.bd/uploads/2020/09/040adadb-f28b-4471-b362-93f449709ed1.jpg",
                              optName: "Robi elite"),
                          Spacer(),
                          HomePageOpt(optImageLink: "https://freesvg.org/img/1425664271.png",
                              optName: "Smartphones"),
                          Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          HomePageOpt(optImageLink: "https://thumbs.dreamstime.com/z/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-164230611.jpg",
                              optName: "Electronic Accessories"),
                          HomePageOpt(optImageLink: "https://www.nicepng.com/png/detail/255-2550209_indian-woman-in-saree-sketch-woman-in-sari.png",
                              optName: "Women's Fashion"),
                          HomePageOpt(optImageLink: "https://cdn.shopify.com/s/files/1/0982/6154/products/3-Tier-Shelf-Home-Kitchen-Storage-Wire-KW19-Brown-01_grande_2x.jpg?v=1581595777",
                              optName: "Kitchen & Dining"),
                          Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }

    ListTile drawerOption(IconData optIcon,String optname){
   return ListTile(
     title: Text(optname),
     leading: Icon(optIcon),
   );
    }