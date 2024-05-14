/*  */
import 'package:elbi_donation_system/screens/authentication_screens/sign_in_page.dart';
import 'package:elbi_donation_system/screens/authentication_screens/sign_up_page.dart';
import 'package:elbi_donation_system/screens/donor_screens/donor_home_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      ListTile(
          title: const Text("Sign In"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInPage()));
          }),
      ListTile(
          title: const Text("Sign Up"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpPage()));
          }),
      ListTile(
          title: const Text("Donate"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DonorHomePage()));
          })
    ]));
  }
}
