import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/common/constants/error_handling.dart';
import 'package:flutter_doctor_app/features/home/screens/home_screen.dart';
import 'package:flutter_doctor_app/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_doctor_app/common/constants/global_variables.dart';
import 'package:flutter_doctor_app/common/constants/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  // Sign In
  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            // Setting token
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
              'x-auth-token',
              jsonDecode(res.body)['token'],
            );

            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }
}
