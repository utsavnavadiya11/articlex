import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '/config/const/theme_consts.dart';
import '/config/dev/dev_helper.dart';

class ApiProvider {
  Future<dynamic> callService(
      {String? method,
      String? url,
      Map<String, String>? headers,
      Map<String, dynamic>? requestBody,
      bool? showSuccessToast = false}) async {
    http.Response? response;
    Map<String, String> reqHeader = {};
    Map<String, dynamic> reqBody = {};

    // Header Encrypt
    reqHeader = headers ?? {};
    // Body Encrypt
    reqBody = requestBody ?? {};
    devPrint(reqBody);
    if (method == 'GET') {
      response = await http.get(Uri.parse(url!.trim()), headers: reqHeader);
    } else if (method == 'POST') {
      response = await http.post(Uri.parse(url!.trim()),
          headers: reqHeader, body: reqBody);
    } else if (method == 'DELETE') {
      response = await http.delete(Uri.parse(url!.trim()),
          headers: reqHeader, body: reqBody);
    }

    return _response(response!, url!, reqHeader, reqBody, showSuccessToast);
  }

  dynamic _response(http.Response response,
      [String url = '',
      Map<String, String>? headers,
      Map<String, dynamic>? requestBody,
      bool? showSuccessToast = false]) async {
    String decyptedString = response.body;
    dynamic responseJson;

    switch (response.statusCode) {
      case 200:
        responseJson = json.decode(decyptedString);
        if (showSuccessToast == true) {
          showSuccess(responseJson['message']);
        }
        return responseJson;
      case 400:
        responseJson = json.decode(decyptedString);
        showError(responseJson['message']);
        return responseJson;
      case 401:
        responseJson = json.decode(decyptedString);
        showError(responseJson['message']);
        return responseJson;
      case 409:
        responseJson = json.decode(decyptedString);
        showError(responseJson['message']);
        return responseJson;
      case 402:
        responseJson = json.decode(decyptedString);
        showError(responseJson['message']);
        return responseJson;
      case 403:
        responseJson = json.decode(decyptedString);
        showError(responseJson['message']);
        return responseJson;
      case 404:
        responseJson = {
          'status': 404,
          'message': 'The requested URL was not found.'
        };
        showError(responseJson['message']);
        return responseJson;
      case 422:
        return null;
      case 500:
        responseJson = json.decode(decyptedString);
        showError("Something went wrong !");
        return responseJson;
      default:
        responseJson = json.decode(decyptedString);
        return responseJson;
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> showError(String message) async {
  if (Get.isSnackbarOpen) {
    await Get.closeCurrentSnackbar();
  }
  Get.rawSnackbar(
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ThemeConsts.kWhiteTextColor),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: ThemeConsts.kToastErrorColor,
    borderRadius: 60,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  );
}

Future<void> showSuccess(String message) async {
  if (Get.isSnackbarOpen) {
    await Get.closeCurrentSnackbar();
  }
  Get.rawSnackbar(
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ThemeConsts.kWhiteTextColor),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: ThemeConsts.kToastSuccessColor,
    borderRadius: 60,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  );
}
