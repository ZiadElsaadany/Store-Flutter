
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_categories_services.dart';
import '../services/all_product_services.dart';
import '../widgets/customCard.dart';

class Homepage extends StatelessWidget {
   Homepage({Key? key}) : super(key: key);
 static const String routeName ='home' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    actions: [
      IconButton(icon: Icon( FontAwesomeIcons.cartPlus )
          ,color:Colors.black,
      onPressed:  ( ) {} ,),
    ],
    backgroundColor: Colors.white ,
    elevation: 0 ,
    centerTitle: true,
    title: const Text( 'New Trend',style: TextStyle(
      color: Colors.black
    ),),
  ),
      body: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProducts(),
          builder:(context,snapshot){
            if(snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      itemBuilder: (ctx, index) {
                        return CustomCard(productModel: snapshot.data![index],);
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 50,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 5

                      ),
                      itemCount: snapshot.data?.length,
                    ),
                  ),
                ],
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }



            }

      )
    );
  }
}
