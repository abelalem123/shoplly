import 'package:flutter/material.dart';
import 'package:shoplly/components/scrollable.dart';
import 'package:badges/badges.dart';
import 'package:shoplly/pages/cartpage.dart';
import 'package:shoplly/pages/filterpage.dart';
import 'package:provider/provider.dart';
import 'package:shoplly/provider/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
  
}


class _HomepageState extends State<Homepage>  with SingleTickerProviderStateMixin{
  late TabController controller;
  double listViewOffset=0.0;

  @override
  void initState() {
    super.initState();
    controller = new TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  int _selectedIndex=1;
  int selecteditem=0;
  @override
  Widget build(BuildContext context) {
 
  
    return DefaultTabController(
      length: 3,
      
      child: Scaffold(
        backgroundColor: Colors.white,
         bottomNavigationBar: BottomNavigationBar(
      
      type: BottomNavigationBarType.fixed,
      
      currentIndex: _selectedIndex,
      //backgroundColor: Colors.white,
      
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        setState(() {
      _selectedIndex=value;
        });
      },
      items: [
        BottomNavigationBarItem(
      label: 'Home',
      
      icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
      label: "Products",
      icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
      backgroundColor: Colors.red,
         label: "contact",
      icon: Icon(Icons.person),
        ),
        BottomNavigationBarItem(
      label: 'About',
      icon: Icon(Icons.info),
        ),
      
      ],
      ),
      
        appBar: AppBar(
        
         toolbarHeight: 100,
          elevation: 0,
         
          actions: [
          Badge(

           
            badgeContent: Text(context.watch<AddedCart>().addedProducts.length.toString(),style: TextStyle(color: Colors.white),),
       gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
            position: BadgePosition.topEnd(top: 18,end: 2),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>YourCart()));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  
                  border: Border.all(color: Colors.grey),
                
                  shape: BoxShape.circle,
                  
                ),
                
                child:  Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('icons/bag.svg', color: Colors.black,),
                ),
              ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15),
           child: CircleAvatar(
             maxRadius: 25,
             foregroundImage: AssetImage('images/image1.jpeg'),
           ),
         )
          ],
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('icons/logo.svg', color: Colors.black,),
               // Text('Shoplly',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(),
            Row(
              
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40)
        
                    ),
                    height: 70,
                    width: 280,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        SvgPicture.asset('icons/search.svg',height: 30,width: 30,),
                        Container(
                          
                          height: 50,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: TextFormField(
                              showCursor: false,
                              
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Search",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterPage()));
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Icon(Icons.menu),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              //color: Colors.black,
      
              height: 50,
             // width: double.maxFinite,
              child: TabBar(
                labelColor: Colors.black,
              
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                tabs: [
      
                  Tab(text: 'Electronics',),
                  Tab(text: 'Clothes'),
                  Tab(text: 'Shoes  ') 
              ]),
            ),
            SizedBox(height: 10,),
            Divider(),
            Container(
             
            height: MediaQuery.of(context).size.height*0.53,
           //   width: double.maxFinite,
            child: TabBarView(
              children: [
      
            StatefulListView(
              i: 0,
            
          getOffsetMethod: () => listViewOffset,
          setOffsetMethod: (offset) => this.listViewOffset = offset,
        ),
             
            StatefulListView(
              i: 1,
            
          getOffsetMethod: () => listViewOffset,
          setOffsetMethod: (offset) => this.listViewOffset = offset,
        ),
              StatefulListView(
              i: 2,
            
          getOffsetMethod: () => listViewOffset,
          setOffsetMethod: (offset) => this.listViewOffset = offset,
        ),
              ],
            ),
            )
          ],
        )
      ),
    );
  }
}