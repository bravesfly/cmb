import 'package:get/get.dart';
import 'package:pull_to_refresh_pro/pull_to_refresh_pro.dart';

class ProfileController extends GetxController {
  var isFirstViewVisible = true.obs;

  void toggleView() {
    isFirstViewVisible.value = !isFirstViewVisible.value;
  }
}


class ProfileRefreshController extends GetxController {
  var items = <String>[].obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  void fetchInitialData() {
    List<String> initialData = List.generate(20, (index) => "Item $index");
    items.addAll(initialData);
  }

  void onRefresh() async {
    // 模拟网络请求
    await Future.delayed(Duration(milliseconds: 1000));
    items.clear();
    fetchInitialData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // 模拟网络请求
    await Future.delayed(Duration(milliseconds: 1000));
    List<String> moreData = List.generate(10, (index) => "Item ${items.length + index}");
    items.addAll(moreData);
    if (moreData.isEmpty) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}