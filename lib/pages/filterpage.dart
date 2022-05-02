import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({ Key? key }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}


class _FilterPageState extends State<FilterPage> {
   List<bool> _isChecked=[];
    List<bool> _isSorted=[];
   List<String> filters=['Sofas','Beds','Tables','TV Stands','Wardrobes','Cabinets','Dressers','Other'];
   List<String> sorts=['Discounts','Best Selling', 'Price,low to high','Price,high to low'];
  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(filters.length, false);
    _isSorted=List<bool>.filled(sorts.length, false);
  }
  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Filter & Sort',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),
        actions: [
          Center(child: GestureDetector(
            onTap: (){
              setState(() {
                 _isChecked = List<bool>.filled(filters.length, false);
    _isSorted=List<bool>.filled(sorts.length, false);
              });
            },
            child: Text('Clear',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,decoration: TextDecoration.underline,),),
          )),
          SizedBox(width: 20,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey,),
            Container(height: MediaQuery.of(context).size.height*0.56,
            child: ListView.builder(
              itemCount: filters.length,
              itemBuilder: (context,index){
              return ListTile(
                leading: Checkbox(
                  
                  fillColor: MaterialStateProperty.all(Colors.black),
                  value: _isChecked[index], onChanged: (value){
                    setState(() {
                      _isChecked[index]= value!;
                    });
                    
                  print(index);
                }),
                title: Text(filters[index],style: TextStyle(fontWeight: FontWeight.w600),),
              );
            }),),
        
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('Sort',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
            ),
            Divider(),
              Container(height: MediaQuery.of(context).size.height*0.4,
            child: ListView.builder(
              itemCount: sorts.length,
              itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: (){
                   setState(() {
                        if(_isSorted[index]==false){
                        _isSorted[index]=true;
                      }else{
                        _isSorted[index]=false;
                      }
                   });
                   
                    },
                    child: Container(
                      
                      height: 25,
                      width: 25,
                      child: Icon(Icons.circle,color: Colors.white,size: 10,),
                      
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle, color: _isSorted[index]? Colors.black:Colors.white)
                      ),
                  ),
                  title: Text(sorts[index],style: TextStyle(fontWeight: FontWeight.w600),),
                ),
              );
            }),),
          ],
        ),
      ),
    );
  }
}