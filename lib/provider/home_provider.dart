import 'package:flutter/cupertino.dart';
import 'package:jadroo/model/home_model.dart';
import 'package:jadroo/repo/home_repo.dart';

class HomeProvider with ChangeNotifier{
  HomeRepo homeRepo=HomeRepo();
  HomeModel _homeModel=HomeModel();

  HomeModel get homeModel => _homeModel;
  initializeHomeModel(){
    _homeModel=homeRepo.homeModel;
    notifyListeners();
  }
}