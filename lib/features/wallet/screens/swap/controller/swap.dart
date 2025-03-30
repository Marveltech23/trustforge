import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustforge/navigationmenu.dart';
import 'package:trustforge/utils/constants/colors.dart';
import 'package:trustforge/utils/http/models/assetnetwork.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SwapController extends GetxController {
  var assets = <AssetData>[].obs;
  var selectedAssetId = ''.obs;
  var selectedAssetAddress = ''.obs;
  var selectedNetworkId = ''.obs;
  var selectedNetworkAddress = ''.obs;
  var isLoading = false.obs;

  late TextEditingController amountController;

  @override
  void onInit() {
    super.onInit();
    fetchAssets();

    amountController = TextEditingController();
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchAssets() async {
    isLoading.value = true;
    String? token = await _getToken();

    if (token == null || token.isEmpty) {
      print('Token not found');
      isLoading.value = false;
      return;
    }

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var request = http.Request(
        'GET', Uri.parse('https://app.trustforge.cc/api/user-addresses'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final String responseBody = await response.stream.bytesToString();
        final assetResponse = AssetResponse.fromJson(json.decode(responseBody));
        assets.assignAll(assetResponse.data);
      } else {
        print('Failed to load assets: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching assets: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendAsset() async {
    isLoading.value = true;
    String? token = await _getToken();

    if (token == null || token.isEmpty) {
      print('Token not found');
      isLoading.value = false;
      return;
    }

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    var request = http.Request(
        'POST', Uri.parse('https://app.trustforge.cc/api/swap-asset'));
    request.bodyFields = {
      'from': selectedAssetId.value,
      'from_address': selectedAssetAddress.value,
      'to': selectedNetworkId.value,
      'to_address': selectedNetworkAddress.value,
      'amount': amountController.text,
    };
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      isLoading.value = false;
      if (response.statusCode == 200) {
        print('Asset sent successfully');
        showSuccessDialog();
        clearFormFields();
      } else {
        print('Failed to send asset');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error: $e');
    }
  }

  void showSuccessDialog() {
    Get.defaultDialog(
      backgroundColor: MColors.subprimaryColor,
      title: 'Success',
      middleText: 'Successfully Sent',
      textConfirm: 'OK',
      onConfirm: () {
        Get.back(); // Close the dialog
        Get.to(() => const NavigationMenu()); // Navigate to NavigationMenu
      },
    );
  }

  void clearFormFields() {
    amountController.clear();
    selectedAssetId.value = '';
    selectedAssetAddress.value = '';
    selectedNetworkId.value = '';
    selectedNetworkAddress.value = '';
  }
}
