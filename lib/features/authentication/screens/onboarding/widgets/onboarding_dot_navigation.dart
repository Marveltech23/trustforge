import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trustforge/features/authentication/controller%20onboarding/onboarding_controller.dart';
import 'package:trustforge/utils/constants/colors.dart';
import 'package:trustforge/utils/constants/sizes.dart';
import 'package:trustforge/utils/device/device_utility.dart';
import 'package:trustforge/utils/helpers/helper_funtions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = MHelperFunction.isDarkMode(context);
    return Positioned(
        bottom: MDeviceUtils.getBottomNavigationBarHeight() + 85,
        left: Msizes.defaultSpace,
        right: Msizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? MColors.light : MColors.dark,
              dotHeight: 6),
        ));
  }
}
