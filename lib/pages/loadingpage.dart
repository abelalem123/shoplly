import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoplly/pages/finalpage.dart';

class LoadingPage extends StatefulWidget {
  final String add1;
  final String add2;
  final String city;
  final String coutry;
  final String totalprice;
  const LoadingPage({ Key? key, required this.add1, required this.add2, required this.city, required this.coutry, required this.totalprice }) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
     Timer(Duration(seconds: 3), (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalPage(
       totalprice: widget.totalprice,
       add1: widget.add1,
       add2: widget.add2,
       city: widget.city,
       coutry: widget.coutry,)));});
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: CircularProgressIndicator(color: Colors.black,strokeWidth: 8,),
        ),
        SizedBox(height: 60,),
        Container(
          constraints: BoxConstraints(maxWidth: 200),
          child: Text('Your order is being processed.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
          
      ],),
    );
  }
}