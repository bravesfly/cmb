import 'package:get/get.dart';

import '../controllers/wealth_controller.dart';

class WealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WealthController>(
      () => WealthController(),
    );
  }
}
