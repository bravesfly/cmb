import 'package:get/get.dart';

import '../controllers/lives_controller.dart';

class LivesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LivesController>(
      () => LivesController(),
    );
  }
}
