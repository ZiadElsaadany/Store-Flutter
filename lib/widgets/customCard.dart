import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key,required this.productModel}) : super(key: key);
ProductModel productModel ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 40,
                  spreadRadius: 0,
                )]
            ),
            child: Card(
              clipBehavior: Clip.none,
             elevation: 20 ,
              color: Colors.white,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text( '${productModel.title.substring(0, 6)}', style: TextStyle(
                        color: Colors.grey ,
                        fontSize: 16,
                        fontWeight:  FontWeight.bold



                    ),
                    ),
                  )

                  ,
                  SizedBox(height: 3,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( r'$' '${productModel.price}',style: TextStyle (
                          fontWeight: FontWeight.bold
                        ),),
                        Icon(FontAwesomeIcons.heart)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
//efjiweghoio
              // msad msa sma smas
              ),
            ),
          ),
          Positioned(
              right: 5,
              top: -40,
              child: Image.network(productModel.image, width: 100, height: 120,),
          )
        ],
      ),
    );
  }
}
