import 'package:flutter/material.dart';

class ProductShowHorizontal extends StatefulWidget {
  String productName;
  String productPrice;
  String productImage;
   ProductShowHorizontal({Key? key,
     required this.productImage,
     required this.productName,
     required this.productPrice,
   }) : super(key: key);

  @override
  State<ProductShowHorizontal> createState() => _ProductShowHorizontalState();
}

class _ProductShowHorizontalState extends State<ProductShowHorizontal> {
  @override
  Widget build(BuildContext context) {
    double scheight= MediaQuery.of(context).size.height;
    double scWidth= MediaQuery.of(context).size.width;
    return  Padding(
      padding:  EdgeInsets.only(left: 7.0),
      child: Container(
        height: scheight*.22,
        width: scWidth*.8,
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: scheight*.22,
                width: scWidth*.4,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.productImage),fit: BoxFit.cover,
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children:[
                        TextSpan(
                          text: widget.productName,
                        ),

                      ],
                    ),
                  ),
                  Spacer(),
                  Text(widget.productPrice,style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
