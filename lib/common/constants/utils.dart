import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/features/auth/services/auth_service.dart';
import 'package:flutter_doctor_app/features/home/screens/home_screen.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void showAlertDialog(BuildContext context, String title, String text,
    String yesBtnText, String cancelBtnText) {
  final AuthServices authServices = AuthServices();
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    },
    style:
        ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0),
    child: Text(
      yesBtnText,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
  );
  Widget continueButton = ElevatedButton(
    onPressed: () {
      authServices.logOut(context);
    },
    style:
        ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0),
    child: Text(
      cancelBtnText,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(text),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
