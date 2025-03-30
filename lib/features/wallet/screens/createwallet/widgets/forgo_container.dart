import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trustforge/utils/constants/colors.dart';
import 'package:trustforge/utils/constants/sizes.dart';

class forgecontainer extends StatelessWidget {
  const forgecontainer({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MColors.subprimaryColor,
          borderRadius: BorderRadius.circular(Msizes.borderRadiusMd),
        ),
        child: Row(
          children: [
            const Icon(
              Iconsax.security,
              color: MColors.light,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              textAlign: TextAlign.start,
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
