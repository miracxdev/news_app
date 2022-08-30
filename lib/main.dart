import 'package:flutter/material.dart';
import 'package:new_app/ui/home_screen/controller/home_controller.dart';
import 'package:new_app/ui/home_screen/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
     MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_)=> HomeController())
      
     ],
     child: const MyApp(),
     )
  );
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
