

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplly/provider/cart.dart';

class ProductCard extends StatefulWidget {

   ProductCard({ Key? key, required this.name, required this.price, required this.url, required this.description,  }) : super(key: key);
   final String name;
   final int price;
   final String url;
   final String description;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool touched=false;
  String title='ADD TO CART';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(20),
        
           color: Colors.white,
            boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 4,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
        ),
        height: 200,
      //  width: 200,
      child: Row(
        children: [
          SizedBox(width: 10,),
         Container(
           height: 180,
           width: 150,
           decoration: BoxDecoration(
            // color: Colors.black,
             borderRadius: BorderRadius.circular(20),
             image: DecorationImage(
               fit: BoxFit.cover,
               image: NetworkImage(widget.url))
           ),
         ),
         SizedBox(width: 20,),
         Padding(
           padding: const EdgeInsets.only(top: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 constraints: BoxConstraints(maxWidth: 160),
                 child: Text(widget.name,overflow: TextOverflow.ellipsis,)),
               SizedBox(height: 10,),
               Text('\$${widget.price.toString()}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
             SizedBox(height: 70,),
             GestureDetector(
               onTap: (){
                 setState(() {
                   touched=true;
                   title='ADDED';
             context.read<CartCount>().increment();
             context.read<AddedCart>().addTocart(widget.name, widget.description, widget.price,widget.url);
             context.read<AddedCont>().addContainer(widget.name, widget.description, widget.price, widget.url);
             
                 });
               },
               child: Container(
                 height: 60,
                 width: 180,
                 child: Center(child: Text(title,style: TextStyle(color:touched==false? Colors.white:Colors.black,fontWeight: FontWeight.w500),)),
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.black),
                   borderRadius: BorderRadius.circular(50),
                  color: touched==false? Colors.black:Colors.white,
                 ),
                ),
             )
             ],
           ),
         )
        ],
      ),
        
       
      ),
    );
  }
}