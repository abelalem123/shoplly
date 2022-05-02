import 'package:flutter/material.dart';
import 'package:shoplly/model/product_model.dart';

class CartSummaryCard extends StatelessWidget {
 Product product;
   CartSummaryCard({ Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
          height: 180,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                   Container(
                 height: 150,
                 width: 150,
                 decoration: BoxDecoration(
                  // color: Colors.black,
                   borderRadius: BorderRadius.circular(20),
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     image: NetworkImage(product.url))
                 ),
               ),
               SizedBox(width: 20,),
               Padding(
                 padding: const EdgeInsets.only(top: 30),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: Text(product.name,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),)),
                           SizedBox(height: 10,),
                            Container(
                              constraints: BoxConstraints(maxWidth: 150),
                              child: Text(product.Description,maxLines: 4,overflow: TextOverflow.ellipsis,)),
                          
                   ],
                 ),
               ),
               Text('\$${product.price}',style: TextStyle(fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}