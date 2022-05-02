import 'package:flutter/material.dart';
import 'package:shoplly/components/cart_card.dart';
import 'package:provider/provider.dart';
import 'package:shoplly/pages/cartsummarypage.dart';
import 'package:shoplly/provider/cart.dart';


class YourCart extends StatefulWidget {
  const YourCart({ Key? key }) : super(key: key);

  @override
  State<YourCart> createState() => _YourCartState();
}

class _YourCartState extends State<YourCart> {
  @override
  Widget build(BuildContext context) {
    int sum=0;
    int summ=0;
    for(int i=0;i< context.read<AddedCart>().addedProducts.length;i++){
      sum=(sum+context.read<AddedCart>().addedProducts[i].price) as int;
    }
    for(int i=0;i< context.read<CartPrice>().pricess.length;i++){
      summ=(summ+context.read<CartPrice>().pricess[i]) as int;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Continue Shopping',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Your Cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            
         
            Container(height: MediaQuery.of(context).size.height*0.6,
            child: ListView.builder(
              itemCount: context.watch<AddedCart>().addedProducts.length,
              itemBuilder: (context,index){
              return CartCard(
                index: index,
                name: context.watch<AddedCart>().addedProducts[index].name,
                Descripion:context.watch<AddedCart>().addedProducts[index].Description ,
                price:context.watch<AddedCart>().addedProducts[index].price ,
                url:context.watch<AddedCart>().addedProducts[index].url  ,
              );
            }),
            ),
            //CartCard(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text('Total Incl. Tax',style: TextStyle(fontWeight: FontWeight.bold),),
                   Padding(
                 padding: const EdgeInsets.only(left:180),
                 child: Text('\$${context.read<CartPrice>().clicked?context.read<CartPrice>().summ: sum}',style: TextStyle(fontWeight: FontWeight.bold),),
               )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartSummary(
                   totalPrice:context.read<CartPrice>().clicked?context.read<CartPrice>().summ.toString(): sum.toString(),
                  )));
                },
                child: Container(
                  child: Center(child: Text('PROCESS TO CHECKOUT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}