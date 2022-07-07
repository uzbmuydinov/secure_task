import 'package:get/get.dart';
import 'package:secure_task/controller/create_controller.dart';
import 'package:secure_task/controller/edit_controller.dart';
import 'package:secure_task/controller/home_controller.dart';



class ControllersBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
    Get.put<EditController>(EditController());
    Get.put<CreateController>(CreateController());
  }
}