import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:trustforge/features/authentication/controller%20onboarding/onboarding_controller.dart';
import 'package:trustforge/features/authentication/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:trustforge/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:trustforge/features/authentication/screens/onboarding/widgets/onbording_skip.dart';
import 'package:trustforge/utils/constants/colors.dart';
import 'package:trustforge/utils/constants/images_string.dart';
import 'package:trustforge/utils/constants/sizes.dart';
import 'package:trustforge/utils/constants/text_strings.dart';
import 'package:trustforge/utils/device/device_utility.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        backgroundColor: MColors.primaryColor,
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.UpdatePageIndicator,
              children: const [
                OnBoardingPage(
                  image: MImage.OnBoardingImage1,
                  title: MText.onBordingTitle1,
                  subTitle: MText.onBordingSubTitle1,
                ),
                OnBoardingPage(
                  image: MImage.OnBoardingImage2,
                  title: MText.onBordingTitle2,
                  subTitle: MText.onBordingSubTitle2,
                ),
                OnBoardingPage(
                  image: MImage.OnBoardingImage3,
                  title: MText.onBordingTitle3,
                  subTitle: MText.onBordingSubTitle3,
                )
              ],
            ),
            const OnboardingSkip(),
            // const OnBoardingDotNavigation(),
            const OnBoardingNextButton(),
            const SizedBox(
              height: Msizes.defaultSpace,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: MDeviceUtils.getBottomNavigationBarHeight() - 40,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Msizes.defaultSpace),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: MText.getstarted,
                          style: TextStyle(fontSize: 11, color: MColors.light),
                        ),
                        TextSpan(
                          text: MText.termsofServices,
                          style: TextStyle(
                              fontSize: 11, color: Colors.blue.shade200),
                        ),
                        const TextSpan(
                          text: MText.and,
                          style: TextStyle(fontSize: 11, color: MColors.light),
                        ),
                        TextSpan(
                          text: MText.privacyPolicy,
                          style: TextStyle(
                              fontSize: 11, color: Colors.blue.shade200),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
