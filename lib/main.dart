import 'package:flutter/material.dart';
import 'package:shoplly/pages/filterpage.dart';
import 'package:shoplly/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shoplly/provider/cart.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>CartCount()),ChangeNotifierProvider(create: (_)=>AddedCart()),ChangeNotifierProvider(create: (_)=>CartPrice()),
      ChangeNotifierProvider(create: (_)=>AddedCont()),
      ChangeNotifierProvider(create: (_)=>TextFormData())],
    child:  MyApp(),)
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final HttpLink httpLink = HttpLink('https://shoplly-api.techawks.io/graphql');
   ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ));
    return  GraphQLProvider(
client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       
        home: Homepage(),
      ),
    );
  }
}
