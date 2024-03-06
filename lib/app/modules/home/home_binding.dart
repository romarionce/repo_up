import 'package:get/get.dart';
import 'package:repo_up/app/data/repository/product_repository.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(ProductRepository(Get.find())),
    );
  }
}
