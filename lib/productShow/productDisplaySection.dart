import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadroo/productShow/productShowHorizontal.dart';

class ProductDisplay extends StatefulWidget {
  String productDisplayName;
   ProductDisplay({Key? key,
     required this.productDisplayName,
   }) : super(key: key);

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  @override
  Widget build(BuildContext context) {
    double scheight= MediaQuery.of(context).size.height;
    double scWidth= MediaQuery.of(context).size.width;
    return  Padding(
      padding:  EdgeInsets.only(left: 8.0),
      child: Container(
        height: scheight*.3,
        decoration: BoxDecoration(
          color:  Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.productDisplayName,style: TextStyle(
                    color: Color(0xFF000051),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("View All",style: TextStyle(
                    color: Colors.blue,
                  ),),
                )
              ],
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProductShowHorizontal(productImage: "assets/image/productImage.jpg",
                    productName:"first product  name",
                    productPrice: " ৳ 5000"),
                ProductShowHorizontal(productImage: "assets/image/productImage.jpg",
                    productName:"second product name",
                    productPrice: " ৳ 700"),
                ProductShowHorizontal(productImage: "assets/image/productImage.jpg",
                    productName:"third product name",
                    productPrice: " ৳ 500"),
                ProductShowHorizontal(productImage: "assets/image/productImage.jpg",
                    productName:"fourth product name",
                    productPrice: " ৳ 10"),
                ProductShowHorizontal(productImage: "assets/image/productImage.jpg",
                    productName:"fifth product name",
                    productPrice: " ৳ 12340"),
                ProductShowHorizontal(productImage: "assets/image/productImage.jpg",
                    productName:"sixth product name",
                    productPrice: " ৳ 748"),
              ],
            ),
          )
          ],
        ),

      ),
    );
  }
}

