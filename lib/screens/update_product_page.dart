
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_services.dart';
import 'package:store_app/widgets/customTextField.dart';

class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({Key? key}) : super(key: key);
  static const String id = 'update page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
final GlobalKey<FormState>  keyForm = GlobalKey<FormState>();

 String ? productName  ;

 String ? description  ;

 dynamic price ;

 String  ? image  ;
bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel args = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed:  ( ) {
              Navigator.pop(context);
            } ,
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black,),
          ),
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: keyForm,
              child: Column(
                children: [
                  SizedBox(
                    height:MediaQuery.of(context).size.height*.1,
                  ),
               CustomTextField(
                   word: 'Product Name ',
                 fun:  ( value) {
                     productName = value ;
                 } ,
                 ),
               SizedBox(height: 10,),
               CustomTextField(
                 fun: (value) {
                   description = value ;
                 },
                 word: 'Description',
               ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    inputType: TextInputType.number,
                    fun:  ( value) {
                      price =value;
                    } ,
                      word: 'Price' ,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    fun: (value) {
                      image = value ;
                    }
                    ,
                      word: 'Image',

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: ( )async {
                 isLoading = true;
                 setState(() {});
                 try {
                   await updateProduct(args);
                   print ('success');
                 } catch (e) {
                   print (e.toString());
                 }
                 isLoading = false;
                 setState(() { } );

                    } ,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green
                      ),
                      child: Text( 'Update Product',
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
 Future<void> updateProduct( ProductModel productModel) async {
   await  UpdateProduct().updateProduct(
      title: productName ?? productModel.title ,
      price: price  ?? productModel.price.toString(),
      desc: description?? productModel.description,
      image: image ?? productModel.image,
     id: productModel.id
    ) ;
  }
}
