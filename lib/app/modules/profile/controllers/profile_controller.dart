import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isFirstViewVisible = true.obs;

  void toggleView() {
    isFirstViewVisible.value = !isFirstViewVisible.value;
  }
}
