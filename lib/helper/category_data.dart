import 'package:wallpaper_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);
  CategoryModel categoryModel;
  categoryModel = CategoryModel('Nature',
      'https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
  categories.add(categoryModel);
  categoryModel = CategoryModel('Wild Life',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Wildlife_at_Maasai_Mara_%28Lion%29.jpg/1200px-Wildlife_at_Maasai_Mara_%28Lion%29.jpg');
  categories.add(categoryModel);
  categoryModel = CategoryModel('Street Art',
      'https://isupportstreetart.blob.core.windows.net/issabucket/2020/01/pexel-1024x765.jpeg');
  categories.add(categoryModel);
  categoryModel = CategoryModel('Gaming',
      'https://signal.avg.com/hubfs/Blog_Content/Avg/Signal/AVG%20Signal%20Images/9%20Ways%20to%20Boost%20Your%20Gaming%20Rig/How_to_Improve_Your_Gaming_PC_Performance-Hero.jpg');
  categories.add(categoryModel);

  categoryModel = CategoryModel('Cities',
      'https://www.planetware.com/wpimages/2020/03/world-most-visited-cities-hong-kong.jpg');
  categories.add(categoryModel);
  categoryModel = CategoryModel('Coding',
      'https://www.incimages.com/uploaded_files/image/1920x1080/software-computer-code-1940x900_35196.jpg');
  categories.add(categoryModel);
  categoryModel = CategoryModel('Flowers',
      'https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
  categories.add(categoryModel);

  return categories;
}
