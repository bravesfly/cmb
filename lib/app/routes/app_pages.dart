import 'package:get/get.dart';

import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/community_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lives/bindings/lives_binding.dart';
import '../modules/lives/views/lives_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/wealth/bindings/wealth_binding.dart';
import '../modules/wealth/views/wealth_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const CommunityView(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.WEALTH,
      page: () => const WealthView(),
      binding: WealthBinding(),
    ),
    GetPage(
      name: _Paths.LIVES,
      page: () => const LivesView(),
      binding: LivesBinding(),
    ),
  ];
}
