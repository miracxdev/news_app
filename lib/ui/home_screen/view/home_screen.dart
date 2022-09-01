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
    final controller = Provider.of<HomeController>(context, listen: false);
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        actions: const [SizedBox(
          width: 40,
          child: Icon(Icons.newspaper_rounded))],
        backgroundColor: const Color(0xffC21010),
        title: const Text("News"),
      ),
      backgroundColor: Colors.black,
      body: controller.homeResponseList!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.homeResponseList!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  tileColor: Colors.grey.shade900,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                        controller.homeResponseList![index].urlToImage ?? ""),
                  ),
                  title: Text(controller.homeResponseList![index].title ?? "",
                      style: const TextStyle(fontSize: 15, color: Colors.white)),
                  // subtitle: Text(
                  //   style: TextStyle(color: Colors.black),
                  //     controller.homeResponseList![index].description ?? ""),
                ),
              ),
            ),
    );
  }
}
