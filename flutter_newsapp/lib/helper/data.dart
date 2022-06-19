

import 'package:flutter_newsapp/models/category_model.dart';

List<CategoryModel> getcategory() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageURL ="https://media.istockphoto.com/photos/golf-and-businees-break-picture-id157479500?s=612x612";
  category.add(categoryModel);

  //2
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categoryModel);

  //4
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categoryModel);

  //5
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  //5
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageURL = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  return category;

}

