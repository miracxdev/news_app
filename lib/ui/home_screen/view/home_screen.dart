import 'package:flutter/material.dart';
import 'package:new_app/ui/home_screen/controller/home_controller.dart';
import 'package:new_app/ui/info_screen/view/info_screen.dart';
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
        actions: const [
          SizedBox(width: 40, child: Icon(Icons.newspaper_rounded))
        ],
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
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoScreen(
                              url: controller.homeResponseList![index].url!),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.network(controller
                                    .homeResponseList![index].urlToImage ??
                                ""),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 6,
                            child: Text(
                                controller.homeResponseList![index].title ?? "",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  )),
    );
  }
}
