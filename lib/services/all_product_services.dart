
import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';


class AllProductServices{
  
  Future<List<ProductModel>>  getAllProducts() async {
    try {
      Api api = Api();
      print('Start getAllProducts');
      List<dynamic> data = await api.get(
          url: 'https://fakestoreapi.com/products');
      List<ProductModel> productsList = [];
      print('Load getAllProducts');
      for (int i = 0; i < data.length; i++) {
        productsList.add(
            ProductModel.fromjson(data[i])
        );
      }
      print('End getAllProducts');
      return productsList;
    }
    catch(E){
      print(E.toString());
      return [];
    }
    }
  }
