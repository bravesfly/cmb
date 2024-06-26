import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gesture_password_widget/widget/gesture_password_widget.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'detail_view.dart';

class LoginAnimation extends EasyLoadingAnimation {
  LoginAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Container(
      child: Obx(() {
        return controller.isFirstViewVisible.value
            ? ProfileWelcomeView()
            : ProfileDetailView();
      }),
    );
  }
}

class ProfileWelcomeView extends GetView<ProfileController> {
  const ProfileWelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('Muzico'),
        elevation: 0.0,
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.support))],
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   tooltip: 'Navigation',
        //   onPressed: () => debugPrint('Navigation button is pressed.'),
        // ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(height: 20), // 间距
              Text('早上好！'),
              SizedBox(height: 30), // 间距
              Gesture(),
              SizedBox(height: 20), // 间距
              Text('更多'),
            ],
          ),
        ),
      )),
    );
  }

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
      ..dismissOnTap = false
      ..customAnimation = LoginAnimation();
  }

  Widget Gesture() {
    final ProfileController controller = Get.find();
    return Container(
      color: Colors.white,
      child: GesturePasswordWidget(
        lineColor: Colors.black,
        errorLineColor: Colors.redAccent,
        singleLineCount: 3,
        identifySize: 80.0,
        hitShowMilliseconds: 40,
        errorItem: Container(
          width: 28.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        normalItem: Container(
          width: 28.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: Color(0xFFDBE0E6),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        selectedItem: Container(
          width: 28.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        hitItem: Container(
          width: 28.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        // answer: [0, 1, 2, 3, 6, 10, 14],
        color: Colors.white,
        onComplete: (data) {
          controller.toggleView();
          // print('成功回调');
          // EasyLoading.instance
          // ..displayDuration = const Duration(milliseconds: 2000)
          // ..indicatorType = EasyLoadingIndicatorType.circle
          // ..loadingStyle = EasyLoadingStyle.dark
          // ..indicatorSize = 45.0
          // ..radius = 10.0
          // ..backgroundColor = Colors.green
          // ..indicatorColor = Colors.yellow
          // ..textColor = Colors.yellow
          // ..maskColor = Colors.blue.withOpacity(0.5);
          // EasyLoading.show(
          //   status: '正在登录....', // 要显示的文字
          // );
          // Future.delayed(const Duration(seconds: 2), () {
          //   //  关闭指示器
          //   EasyLoading.dismiss();
          //   controller.toggleView();
          // });
        },
      ),
    );
  }
}
