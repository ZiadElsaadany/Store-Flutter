import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class UpdateProduct
{
 Future<ProductModel> updateProduct({
    required String  title ,
    required  String price,
    required  String desc,
    required  String  image  ,
   required dynamic id
  }   )  async{

    Map<String,dynamic> data     = await  Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body:  {
        'title': title  ,
        'price' : price ,
        'description' : desc ,
        'image': image ,
        'id': id
      } ,

    );
    return ProductModel.fromjson(data) ;
  }

}