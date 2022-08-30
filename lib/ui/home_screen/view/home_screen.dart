import 'package:flutter/material.dart';
import 'package:new_app/ui/home_screen/controller/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final _controller = Provider.of<HomeController>(context, listen: false);
    _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC21010),
        title: Text("News"),
        
      ),
      backgroundColor: Colors.black,
      body: controller.homeResponseList!.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.homeResponseList!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                      controller.homeResponseList![index].urlToImage ?? ""),
                  title: Text(controller.homeResponseList![index].title ?? "",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  // subtitle: Text(
                  //     controller.homeResponseList![index].description ?? ""),
                ),
              ),
            ),
    );
  }
}
