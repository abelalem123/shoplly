 import 'package:flutter/material.dart';
import 'package:shoplly/components/cart_summarty_card.dart';

import '../model/product_model.dart';

 class CartCount extends ChangeNotifier{
   int _count=0;
   int get count=>_count;
   void increment(){
     _count++;
     notifyListeners();
   }
 }

 class AddedCart extends ChangeNotifier{
   List<Product> _addedProducts=[];
   List get addedProducts=>_addedProducts;
   void addTocart(name,description,price,url){
     Product newproduct=Product(name, description, price,url);
     _addedProducts.add(newproduct);
     notifyListeners();
   }
   void removeFromcart(index){
var product=addedProducts.removeAt(index);
notifyListeners();
   }
 }


 class CartPrice extends ChangeNotifier{
   List<int> counts=[];
   List<int> pricess=[];
   int _summ=0;

int get summ=>_summ;
    bool _clicked =false;
    List get countss=>counts;
    void setCount(addedproducts,index){
        counts = List<int>.filled(addedproducts.length, 1);
         pricess = List<int>.filled(addedproducts.length, 0);
    
      //  for(int i=0;i<addedproducts.length;i++){
      //    pricess.add(addedproducts[i].price);
      //  }
     
    }
    
    bool get clicked=>_clicked;
   List get pricee=>pricess;


void priceval(){
    for(int i=0;i< pricess.length;i++){
      _summ=(_summ+pricess[i]) as int;
      notifyListeners();
    }
}



   void increment(price,index){
     
     counts[index]++;
     _clicked=true;
     pricess[index]=price*counts[index];
     notifyListeners();
   }
     void decrement(price,index){
   if(counts[index]>=1){
   
     counts[index]--;
     _clicked=true;
     pricess[index]=price*counts[index];
     notifyListeners();
   }
   }
 }

 class AddedCont extends ChangeNotifier{
   List<Product> _summarys=[];
   List get summarys=>_summarys;
   void addContainer(name,description,price,url){
     Product prod=Product(name, description, price, url);
     _summarys.add(prod);
     notifyListeners();
   }
 }

 class TextFormData extends ChangeNotifier{
   String _enteredvalue='';
 //  List<String> values=[];
   String get enteredValue=>_enteredvalue;
   void setValue(value){
_enteredvalue=value;
notifyListeners();
   }
 }