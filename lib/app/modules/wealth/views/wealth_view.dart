import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wealth_controller.dart';

class WealthView extends GetView<WealthController> {
  const WealthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WealthView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WealthView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
