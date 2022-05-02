import 'package:flutter/material.dart';

class Product{
  late String name;
  late String Description;
  late int price;
  late String url;
  Product(name,description,price,url){
    this.name=name;
    this.Description=description;
    this.price=price;
    this.url=url;
  }
}