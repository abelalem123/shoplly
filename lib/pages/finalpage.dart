import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shoplly/components/cart_summarty_card.dart';
import 'package:shoplly/pages/homepage.dart';
import 'package:shoplly/provider/cart.dart';

class FinalPage extends StatelessWidget {
    final String add1;
  final String add2;
  final String city;
  final String coutry;
  final String totalprice;
  const FinalPage({ Key? key, required this.add1, required this.add2, required this.city, required this.coutry, required this.totalprice }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
String formattedDate = DateFormat('d MMMM, y').format(now);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SvgPicture.asset('icons/logo.svg', color: Colors.black,),
        ],),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Divider(),
               SvgPicture.asset('icons/success.svg',),
              Container(
                padding: EdgeInsets.only(top: 20),
                constraints: BoxConstraints(maxWidth: 300),
                child: Text('Thank you for shoppingn with Shopply',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),textAlign: TextAlign.center,)),
                SizedBox(height: 20,),
                Text('Your orders are on the way'),
                SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                },
                child: Container(
                          child: Center(child: Text('BACK TO SHOPPING',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.8,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,borderRadius: BorderRadius.circular(30)),
                        ),
              ),
              ],),
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Order Summary',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              ),
               Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                
                  children: [
                  
                 
                  ListTile(leading: Text('ORDER NO',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold),),
                  trailing: Text('568464            ',style: TextStyle(fontWeight: FontWeight.bold),),),
                  ListTile(leading: Text('EST DELIVERY DATE',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold),),
                  trailing: Text(formattedDate+'    ',style: TextStyle(fontWeight: FontWeight.bold),),),
                  ListTile(leading: Text('SHIPPING DETAILS',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold),),
                  trailing: Container(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Text('$add1 $add2, $city $coutry',style: TextStyle(fontWeight: FontWeight.bold),)),)
                ],),
              ),
              Divider(),
              Container(
                height: MediaQuery.of(context).size.height*0.5,
                child: ListView.builder(
                  itemCount: context.watch<AddedCart>().addedProducts.length,
                  itemBuilder: (context,index){
                  
                  return CartSummaryCard(product: context.watch<AddedCart>().addedProducts[index]);
                }),
              ),
             ListTile(
               leading: Text('Total',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 20),),
               trailing: Text('\$$totalprice',style: TextStyle(fontWeight: FontWeight.bold),),
             )
          ],
        ),
      ),
    );
  }
}