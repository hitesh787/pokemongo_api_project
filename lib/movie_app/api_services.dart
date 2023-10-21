// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// snackBar(BuildContext context, msg, {Color? color, VoidCallback? onTap, Duration? duration, bool? isError, GlobalKey<ScaffoldState>? key, bool isBottom = false}) {
//   Duration d = const Duration(milliseconds: 1500);
//   if (duration != null) {
//     d = duration;
//   } else if (isError == true) {
//     d = const Duration(seconds: 3);
//   }
//   final snackBar = SnackBar(
//     backgroundColor: color ?? Colors.red,
//     content: Text(msg),
//     behavior: SnackBarBehavior.floating,
//   );
//   if (isBottom) {
//     return g.Get.rawSnackbar(message: msg, backgroundColor: color ?? Colors.red.shade500, snackPosition: g.SnackPosition.BOTTOM, duration: d);
//   }
//   return ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

class ApiServiceClass {

  static final dio = Dio();

  static Future<Response?> getRequestForMoviesApp(context, String url) async {
    try {
      // print("getRequest $url");
      Response? response = await dio.get(url);
      // print("getRequest status ${response.statusCode}");
      return response;
    } catch (e) {
      print("Socket exception: ${e.toString()}");
      if (e is SocketException) {
        // snackBar(context, AppString.noInternetConnection, duration: const Duration(seconds: 4));
        print("Socket exception: ${e.toString()}");
        return null;
      } else if (e is TimeoutException) {
        // snackBar(context, AppString.serverTimeOut, duration: const Duration(seconds: 4));
        print("Timeout exception: ${e.toString()}");
        return null;
      } else if (e is DioException) {
        if (e.error.toString().contains("SocketException")) {
          // snackBar(context, AppString.noInternetConnection, duration: const Duration(seconds: 4));
          print("catch ${e.error}");
        }
        print("catch ${e.error}");
        return null;
      }
      // snackBar(context, "$e", duration: const Duration(seconds: 4));
      return null;
    }
  }



  static Future<Response?> getRequestForCricketApp(context, String url) async {
    try {
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      print("Socket exception: ${e.toString()}");
      if (e is SocketException) {
        // snackBar(context, AppString.noInternetConnection, duration: const Duration(seconds: 4));
        print("Socket exception: ${e.toString()}");
        return null;
      } else if (e is TimeoutException) {
        // snackBar(context, AppString.serverTimeOut, duration: const Duration(seconds: 4));
        print("Timeout exception: ${e.toString()}");
        return null;
      } else if (e is DioException) {
        if (e.error.toString().contains("SocketException")) {
          // snackBar(context, AppString.noInternetConnection, duration: const Duration(seconds: 4));
          print("catch ${e.error}");
        }
        print("catch ${e.error}");
        return null;
      }
      // snackBar(context, "$e", duration: const Duration(seconds: 4));
      return null;
    }
  }




}
