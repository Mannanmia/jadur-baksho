import 'dart:ui';

import 'package:flutter/material.dart';

class CategoriesOpt extends StatefulWidget {
  String optName;
  String optImageLink;
  CategoriesOpt({Key? key,
    required this.optImageLink,
    required this.optName,
  }) : super(key: key);

  @override
  State<CategoriesOpt> createState() => _CategoriesOptState();
}

class _CategoriesOptState extends State<CategoriesOpt> {
  @override
  Widget build(BuildContext context) {
    double scheight= MediaQuery.of(context).size.height;
    double scWidth= MediaQuery.of(context).size.width;
    return Container(
      height: scheight/6,
      width: scWidth/7,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            Container(
              height: scheight/12,
              width: scWidth/7,
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.optImageLink,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children:[
                  TextSpan(
                    text: widget.optName,
                    style: TextStyle(
                      leadingDistribution: TextLeadingDistribution.even,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
