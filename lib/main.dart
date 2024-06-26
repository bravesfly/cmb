import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'app/controllers/buttom_nav_controller.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/lives/views/lives_view.dart';
import 'app/modules/profile/views/profile_view.dart';
import 'app/modules/wealth/views/wealth_view.dart';
import 'app/routes/app_pages.dart';
import 'app/modules/community/views/community_view.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
    // ..customAnimation = CustomAnimation();
}

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: MainScreen(),
      builder: EasyLoading.init(),
    ),
  );
  configLoading();
}


class MainScreen extends StatelessWidget {
  final ButtomNavController controller = Get.put(ButtomNavController());

  final List<Widget> pages = [
    HomeView(),
    CommunityView(),
    WealthView(),
    LivesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(() => Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFF000000), // 黑色顶线
                  width: 0.3,
                ),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xFFF7F7F7),
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeIndex,
              selectedItemColor: Colors.black, // 选中项文字和图标颜色
              unselectedItemColor: const Color(0xFF8C898A), // 未选中项文字和图标颜色
              unselectedFontSize: 12,
              selectedFontSize: 12,
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              items: [
                BottomNavigationBarItem(
                  icon: IconPadding(iconData: Icons.home_outlined),
                  activeIcon: IconPadding(iconData: Icons.home),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  icon: IconPadding(iconData: Icons.search_outlined),
                  activeIcon: IconPadding(iconData: Icons.search),
                  label: '社区',
                ),
                BottomNavigationBarItem(
                  icon: IconPadding(iconData: Icons.notifications_none),
                  activeIcon: IconPadding(iconData: Icons.notifications),
                  label: '财富',
                ),
                BottomNavigationBarItem(
                  icon: IconPadding(iconData: Icons.settings_outlined),
                  activeIcon: IconPadding(iconData: Icons.settings),
                  label: '生活',
                ),
                BottomNavigationBarItem(
                  icon: IconPadding(iconData: Icons.person_outline),
                  activeIcon: IconPadding(iconData: Icons.person),
                  label: '我的',
                ),
              ],
              type: BottomNavigationBarType.fixed, // 防止图标放大
            ),
          )),
    );
  }
}

class IconPadding extends StatelessWidget {
  final IconData iconData; // 图标数据

  // 构造函数，接受一个图标参数
  const IconPadding({required this.iconData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0), // 你可以根据需要调整padding值
      child: Icon(iconData),
    );
  }
}
