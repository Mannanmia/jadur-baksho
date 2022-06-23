import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadroo/provider/category_provider.dart';
import 'package:provider/provider.dart';

import '../category_opt.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryProvider>(context,listen: false).imitializeCategoryModel();
    double scheight=MediaQuery.of(context).size.height;
    double scWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body:Consumer<CategoryProvider>(
        builder: (context,catpro,i){
          return Row(
            children: [
              Container(
                color: Colors.black12,
                height: scheight,
                width: scWidth*.25,
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      for(int j=0;j<catpro.catModel.catScreenOptlist!.length;j++)
                      CategoriesOpt(optImageLink:catpro.catModel.catScreenOptlist![j].catScreenOptImglink.toString(),
                          optName: catpro.catModel.catScreenOptlist![j].catScreenOptName.toString()),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: scheight,
                  width: scWidth*.75,
                  child: Column(
                    children: [
                      Material(
                        elevation: 20,
                        shadowColor: Colors.black,
                        child: Container(
                          height: scheight*.05,
                          width: scWidth*.75,
                          child: Text("Top Categories",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),),
                        ),
                      ),
                      Container(
                        height: scheight*.95,

                        child: GridView.count(
                          crossAxisCount: 3,
                          children: [ for(int j=0;j<catpro.catModel.catScreenOptlist!.length;j++)
                            CategoriesOpt(optImageLink: catpro.catModel.catScreenOptlist![j].catScreenOptImglink.toString(),
                                optName: catpro.catModel.catScreenOptlist![j].catScreenOptName.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}
