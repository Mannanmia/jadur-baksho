class CategoryModel{
  List<CategoryScreenOpt> ?catScreenOptlist;

  CategoryModel({this.catScreenOptlist});
}
class CategoryScreenOpt{
  String ?catScreenOptName;
  String ?catScreenOptImglink;

  CategoryScreenOpt({this.catScreenOptName, this.catScreenOptImglink});
}