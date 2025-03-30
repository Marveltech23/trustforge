import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trustforge/features/wallet/screens/discover/discover.dart';
import 'package:trustforge/features/wallet/screens/history/history.dart';
import 'package:trustforge/features/wallet/screens/home/home.dart';
import 'package:trustforge/features/wallet/screens/settings/settings.dart';
import 'package:trustforge/features/wallet/screens/swap/swap.dart';
import 'package:trustforge/utils/constants/colors.dart';
import 'package:trustforge/utils/helpers/helper_funtions.dart';
import 'package:trustforge/utils/http/models/registrationmodel.dart';

class NavigationMenu extends StatelessWidget {
  final User? user;

  const NavigationMenu({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(user: user));
    final darkMode = MHelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: MColors.primaryColor,
          indicatorColor: MColors.subprimaryColor,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: MColors.white,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.arrow_swap_horizontal,
                color: MColors.white,
              ),
              label: 'Swap',
            ),
            NavigationDestination(
                icon: Icon(
                  Icons.restore,
                  color: MColors.white,
                ),
                label: 'History'),
            NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: MColors.white,
                ),
                label: 'Settings'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final User? user;
  final Rx<int> selectedIndex = 0.obs;

  NavigationController({
    this.user,
  });

  late final screens = [
    HomeScreen(user: user),
    const SwapScreen(),
    const History(),
    Settings()
  ];
}
