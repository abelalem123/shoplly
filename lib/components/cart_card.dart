import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplly/provider/cart.dart';
class CartCard extends StatefulWidget {
  const CartCard({ Key? key, required this.name, required this.Descripion, required this.price, required this.url, required this.index }) : super(key: key);
  final String name;
  final String Descripion;
  final int price;
  final String url;
  final int index;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartPrice>().setCount(context.read<AddedCart>().addedProducts,widget.index);
  }
  @override
  Widget build(BuildContext context) {
  
    int count=1;
   
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(width: 10,),
             Container(
               height: 150,
               width: 120,
               decoration: BoxDecoration(
                // color: Colors.black,
                 borderRadius: BorderRadius.circular(20),
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image: NetworkImage(widget.url))
               ),
             ),
             SizedBox(width: 20,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 150),
                  child: Text(widget.name,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),)),
                   SizedBox(height: 10,),
                    Container(
                      constraints: BoxConstraints(maxWidth: 150),
                      child: Text(widget.Descripion,maxLines: 4,overflow: TextOverflow.ellipsis,)),
                  
             ],),
             SizedBox(width: 30,),
             GestureDetector(
               onTap: (){
                 context.read<AddedCart>().removeFromcart(widget.index);
               },
               child: Container(
                 height: 50,
                 width: 50,
                 child: Center(child: Text('x',style: TextStyle(color: Colors.grey,fontSize: 20),)),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   border: Border.all(color: Colors.grey)
                 ),
               ),
             )
             
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
               GestureDetector(
                 onTap: (){
                  
                  context.read<CartPrice>().decrement(widget.price,widget.index);
                  context.read<CartPrice>().priceval();
                 },
                 child: Container(
                   height: 40,
                   width: 40,
                   child: Center(child: Text('-',style: TextStyle(color: Colors.black,fontSize: 30),)),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.grey)
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Text(context.watch<CartPrice>().countss[widget.index].toString()),
               ),
                GestureDetector(
                  onTap: (){
                   
                   context.read<CartPrice>().increment(widget.price,widget.index);
                   context.read<CartPrice>().priceval();
                  },
                  child: Container(
                   height: 40,
                   width: 40,
                   child: Center(child: Text('+',style: TextStyle(color: Colors.black,fontSize: 20),)),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.grey)
                   ),
                               ),
                ),
               Padding(
                 padding: const EdgeInsets.only(left:150),
                 child: Text('\$${context.watch<CartPrice>().clicked? context.watch<CartPrice>().pricee[widget.index].toString():widget.price}',style: TextStyle(fontWeight: FontWeight.bold),),
               )
              ],
            ),
          )
        ],
      ),
    );
  }
}