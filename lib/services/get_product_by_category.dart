import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';
class ProductByCategory{


  Future<List<ProductModel>>  getProductByCategory(
   {required String categoryName})
  async {

      List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productList = [] ;
      print (data);
      print ('*****************');
    for(int i = 0 ; i< data.length ; i ++ ) {
      productList.add(ProductModel.fromjson(data[i]));
    }
    print (productList);
      return productList;
  }

}