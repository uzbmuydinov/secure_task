import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_task/controller/home_controller.dart';


class HomePage extends StatefulWidget {
  static String id = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          title: const Text(
            "With secure",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white70,
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (HomeController controller) => Stack(
            children: [
              ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.only(bottom: 18, left: 15, right: 15),
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Text(controller.items[index].title,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins")),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            controller.items[index].body,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    );
                  }),
              controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          foregroundColor: Colors.black,
          onPressed: () {
            Get.find<HomeController>().goToCreatePage(context);
            //Get.changeTheme(ThemeData.dark());
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ));
  }
}
