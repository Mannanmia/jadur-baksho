import 'package:flutter/foundation.dart';
import 'package:jadroo/model/category_model.dart';
import 'package:jadroo/repo/category_repo.dart';

class CategoryProvider with ChangeNotifier{
  CategoryRepo categoryRepo=CategoryRepo();
  CategoryModel _catModel=CategoryModel();

  CategoryModel get catModel => _catModel;
  imitializeCategoryModel(){
    _catModel=categoryRepo.categoryModel;
    notifyListeners();
  }
}