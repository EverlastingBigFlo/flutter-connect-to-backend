import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;

class Utilities {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  
  IosDeviceInfo? iosInfo;
  Color bgDark = const Color.fromARGB(255, 5, 36, 32);
  Color bgLight = const Color.fromARGB(255, 61, 72, 72);
  Color bg = const Color.fromARGB(255, 4, 21, 20);
  String baseUrl = "https://freedomsbank.s3.eu-west-3.amazonaws.com/";
  String avatar =
      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1658786565~exp=1658787165~hmac=9e29fe8fe3aae0e0a7a6c46130c436b88929ee15c57acc0d44ce32be5dd8d066';
  // ignore: prefer_typing_uninitialized_variables
  var devices;
  String? userAgent ;
    String? platform ;
  Utilities();

  getDeviceInfo() async {
    if (kIsWeb) {
      userAgent = html.window.navigator.userAgent;
       platform = html.window.navigator.platform;
      return {'model':userAgent,'id':platform};
    } 
    else if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      devices = androidInfo;
      return {'model': devices.model, 'id': devices.id};
    }

   else if (Platform.isIOS) {
      iosInfo = await deviceInfo.iosInfo;
      devices = iosInfo;
      // print(devices.model);
      return {'model': devices.model, 'id': devices.name};
    }
    

    
  }

  get devicePlatform => getDeviceInfo();

  void mySanckbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(vertical: 100.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3)));
  }

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Copied to clipboard.',
          style: TextStyle(fontSize: 20.0),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(vertical: 100.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3)));
  }

  void visit(String link)async{
      
   if (await canLaunchUrlString(link)) {
    await launchUrlString(link);
    }                              
                                  
  }

String hidePhoneNumber(String phoneNumber) {
  // Check if the phone number is valid and has at least 6 characters
  if (phoneNumber.length < 6) {
    return phoneNumber; // Return the original phone number if it's too short
  }

  // Replace the characters from index 3 to index 8 with asterisks
  return phoneNumber.replaceRange(3, 8, '*****');
}

String hideEmailAddress(String emailAddress) {
  // Check if the email address is valid and contains '@'
  if (!emailAddress.contains('@')) {
    return emailAddress; // Return the original email address if it's invalid
  }

  // Split the email address at '@' to separate the local part and domain part
  List<String> parts = emailAddress.split('@');
  String localPart = parts[0];
  String domainPart = parts[1];

  // Check if the local part has at least 4 characters
  if (localPart.length < 4) {
    return emailAddress; // Return the original email address if the local part is too short
  }

  // Replace characters in the local part with asterisks, except for the first and last character
  String maskedLocalPart =
      localPart[0] + '*' * (localPart.length - 2) + localPart[localPart.length - 1];

  // Combine the masked local part with the domain part
  return '$maskedLocalPart@$domainPart';
}
}
