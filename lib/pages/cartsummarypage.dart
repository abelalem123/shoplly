import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoplly/components/cart_summarty_card.dart';
import 'package:provider/provider.dart';
import 'package:shoplly/model/product_model.dart';
import 'package:shoplly/pages/loadingpage.dart';
import 'package:shoplly/provider/cart.dart';

class CartSummary extends StatefulWidget {
  final String totalPrice;
  const CartSummary({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {

   
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    

  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    } else {
      loginFormKey.currentState!.save();
      return true;
    }
  }
final String address1='';
final String address2='';
final String city='';
final String country='';
  
  bool? valuee=false;
  TextEditingController add1=TextEditingController();
  TextEditingController add2=TextEditingController();
  TextEditingController cityy=TextEditingController();
  TextEditingController countryy=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              Divider(),
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.grey[200],
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Show Order summary'),
                    trailing: Text('\$${widget.totalPrice}'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldsummary(
                      label: 'Email or Phone Number',
                    ),
                    Text(
                      'Shipping Address',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextFieldsummary(
                      label: 'First Name',
                    ),
                    TextFieldsummary(
                      
                      label: 'Last Name',
                    ),
                    TextFieldsummary(
                      contt: add1,
                     
                      label: 'Address Line 1',
                    ),
                    TextFieldsummary(
                      contt: add2,
                      label: 'Address Line 2',
                    ),
                    TextFieldsummary(
                      contt: cityy,
                      label: 'City/Town',
                    ),
                    TextFieldsummary(
                      contt: countryy,
                      label: 'Country',
                    ),
                    TextFieldsummary(
                      label: 'Postal/Zip',
                    ),
                  ],
                ),
              ),
              Row(children: [
                Checkbox(
                   fillColor: MaterialStateProperty.all(Colors.black),
                  value: valuee, onChanged: (value){
                setState(() {
                    valuee=value;
                });
        
                }),
                Text('Save this information for next time',style: TextStyle(fontWeight: FontWeight.bold),)
              ],),
              GestureDetector(
                onTap: (){
                  if(checkLogin()==true){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingPage(
                      add1: add1.text,
                      add2: add2.text,
                      city: cityy.text,
                      coutry: countryy.text,
                      totalprice: widget.totalPrice,
                    )));
                  }
                
                 
                },
                child: Container(
                    child: Center(child: Text('COMPLETE ORDER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldsummary extends StatelessWidget {
  final  contt;
  final String label;
  late var valuee;
   TextFieldsummary({
    Key? key,
    this.valuee,
    required this.label,  this.contt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        
        decoration: InputDecoration(
          
          border: OutlineInputBorder(
          
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          prefixIcon: Icon(Icons.person),
        ),
       onSaved: (val){
         valuee=val;
       },
       controller: contt,
        keyboardType: TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
