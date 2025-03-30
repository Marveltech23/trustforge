import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trustforge/utils/constants/colors.dart';

class Assetsitems extends StatelessWidget {
  const Assetsitems({
    Key? key,
    required this.images,
    required this.coinName,
    required this.amount,
    required this.coinpercentage,
    required this.amountindollars,
    required this.btcamount,
  }) : super(key: key);

  final String coinName;
  final String amount;
  final String coinpercentage;
  final String amountindollars;
  final String btcamount;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              images,
              width: 40, // specify a width for the image
              height: 40, // specify a height for the image
              fit: BoxFit.contain,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                log('Error loading image: $images, error: $error');
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey,
                  child: const Icon(Icons.error, color: Colors.red),
                );
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          coinName,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: MColors.white,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        btcamount,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: MColors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: amount,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                            TextSpan(
                              text: coinpercentage,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        amountindollars,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: MColors.white,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
