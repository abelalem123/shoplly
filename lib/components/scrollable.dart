// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:shoplly/components/product_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class StatefulListView extends StatefulWidget {
  final int i;

  const StatefulListView({Key? key, required this.getOffsetMethod, required this.setOffsetMethod, required this.i,}) : super(key: key);

  final GetOffsetMethod getOffsetMethod;
  final SetOffsetMethod setOffsetMethod;
 

  @override
  _StatefulListViewState createState() => new _StatefulListViewState();
}

class _StatefulListViewState extends State<StatefulListView> {

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController(
      initialScrollOffset: widget.getOffsetMethod()
    );
  }
   String query="""
query{
  categories {
    categoryId
    name
    
    
    products {
      images{url}
    
      productId
      name
      price
      description
     
      
    }
  }
}
""";
  @override
  Widget build(BuildContext context) {
    return new NotificationListener(
      child: Query(
          options: QueryOptions(
            document: gql(query),
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              print("loading");
              return Center(child: CircularProgressIndicator());
            }

            // for (int index = 0; index < 5; index++) {
            //   Hotel hotel = Hotel(
            //     name: result.data?['viewHotels'][index]['name'],
            //     description: result.data?['viewHotels'][index]['description'],
            //     id: result.data?['viewHotels'][index]['Id'],
            //     email: result.data?['viewHotels'][index]['email'],
            //     phoneNo: 09,
            //   );
            //   // hotels.add(hotel);
            // }
            return ListView.builder(
        controller: scrollController,
        itemCount: result.data?['categories'][0]['products'].length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            name: result.data?['categories'][0]['products'][index]['name'],
            price:result.data?['categories'][0]['products'][index]['price'], 
            url: result.data?['categories'][0]['products'][index]['images'][widget.i]['url'],
            description: result.data?['categories'][0]['products'][index]['description'],
          
          );
        }
      );}),
      onNotification: (notification){
        if (notification is ScrollNotification) {
          widget.setOffsetMethod(notification.metrics.pixels);
          return true;
        }
        else{
          return false;
        }
      },
    );
  }
}