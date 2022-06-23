class HomeModel{
   List<String> ? sliderImgList;
List<CategoryOption> ? categoryList;

   HomeModel({this.sliderImgList, this.categoryList});
}
class CategoryOption{
  String ? imglink;
  String ? itemName;

  CategoryOption({this.imglink, this.itemName});
}