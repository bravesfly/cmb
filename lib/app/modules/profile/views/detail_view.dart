import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class ProfileDetailView extends GetView {
  const ProfileDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('DetailView'),
        //   centerTitle: true,
        // ),
        body: Container(
      padding: EdgeInsets.only(top: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFFCF4EB), // 超级浅橙色
            Color(0xFFE3EBF3), // 超级浅蓝色
          ],
          stops: [0.2, 0.8], // 控制颜色扩散范围
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Avatar(),
            SizedBox(
              height: 20,
            ),
            cards(),
            SizedBox(
              height: 16,
            ),
            overview(),
            SizedBox(
              height: 14,
            ),
            accountOverview(),
            MonthlyBilling()
          ],
        ),
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      ),
    ));
  }

  Widget MonthlyBilling() {
    return Container(
      child: Text('本月收支'),
    );
  }

  Widget accountOverview() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: constraints.maxWidth, // 使用父容器的最大宽度
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 12),
                    child: Text(
                      '【福利通知】 免费领2毫克黄金红包>',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: constraints.maxWidth, // 使用父容器的最大宽度
                height: 180 * 0.75,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF686E91), Color(0xFFA1ABC6)], // 深灰色到浅灰色
                    begin: Alignment.topLeft, // 开始位置
                    end: Alignment.bottomRight, // 结束位置
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            '账户总览',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('总资产',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              Text('¥ 1.31',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('昨日收益',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              Text('+15387.1',
                                  style: TextStyle(
                                    fontFamily: 'Din',
                                      color: Colors.white, fontSize: 28)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    //   Container(
    //   width:double.infinity,
    //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular((6.0)),
    //       gradient: RadialGradient(colors: [Colors.grey,  Colors.white],radius: 1, tileMode: TileMode.clamp)
    //   ),
    //
    //   child: Column(
    //     children: [Text('账户总览'), Text('总资产')],
    //   ),
    // );
  }

  Widget overview() {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular((6.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          overviewItem(icon: Icons.circle_notifications_sharp, name: '账户总览'),
          overviewItem(icon: Icons.circle_notifications_sharp, name: '转账'),
          overviewItem(icon: Icons.circle_notifications_sharp, name: '理财'),
          overviewItem(icon: Icons.circle_notifications_sharp, name: '基金'),
          overviewItem(icon: Icons.circle_notifications_sharp, name: '全部'),
        ],
      ),
    );
  }

  Column overviewItem({required String name, required IconData icon}) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(
          height: 15,
        ),
        Text(name),
      ],
    );
  }

  Widget cardNumber(String name, {int number = 0}) {
    return Column(
      children: [
        const Text(
          '银行卡',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          number.toString(),
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Container cards() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardNumber('银行卡', number: 1),
          cardNumber('待办'),
          cardNumber('卡券'),
          cardNumber('积分'),
        ],
      ),
    );
  }

  Row Avatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '**东',
                  style: TextStyle(
                    fontSize: 18.0, // 设置字体大小为 20.0
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '上次登录 1小时前',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Text('会员图标')
      ],
    );
  }
}
