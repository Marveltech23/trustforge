import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:trustforge/features/wallet/screens/history/history.dart';
import 'dart:convert';
import 'package:trustforge/utils/constants/colors.dart';
import '../../../../utils/http/models/transactionhistory.dart';
import 'package:trustforge/utils/http/models/transactionhistory.dart';

class TransactionHistorydeatails extends StatefulWidget {
  const TransactionHistorydeatails({super.key});

  @override
  State<TransactionHistorydeatails> createState() =>
      _TransactionHistorydeatailsState();
}

class _TransactionHistorydeatailsState
    extends State<TransactionHistorydeatails> {
// Fetch transaction history

  Future<List<Transaction>> fetchTransactions() async {
    final response = await http.get(
      Uri.parse('https://app.trustforge.cc/api/transaction-history'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 11|zClZDjSdeJfx0467ylrJSJiOq4mYu07WHNmHd29q35ed7722',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((transaction) => Transaction.fromJson(transaction))
          .toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: MColors.white,
          ),
        ),
        title: Text(
          'Transaction History',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: MColors.white,
                fontSize: 15,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                '-0.0050678 BTC',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: MColors.white, fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                '=\$\281.121',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              height: 169,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: MColors.subprimaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: const Column(
                children: [
                  Ttext(
                    title: 'Date',
                    titlediscripion: '21 Dec 2023, 10:44',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Ttext(
                    title: 'Status',
                    titlediscripion: 'Completed',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Ttext(
                    title: 'Recipient',
                    titlediscripion: 'bcc1w3g....gg',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Ttext(
                    title: 'Network',
                    titlediscripion: '0.000000176BTC(\$\1.01)',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Ttext extends StatelessWidget {
  const Ttext({
    Key? key,
    required this.title,
    required this.titlediscripion,
  }) : super(key: key);

  final String title;
  final String titlediscripion;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
              ),
        ),
        const Spacer(),
        Text(
          titlediscripion,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: MColors.white,
              ),
        ),
      ],
    );
  }
}




// Fetch transaction history


