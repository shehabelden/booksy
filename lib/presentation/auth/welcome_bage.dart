import 'package:flutter/material.dart';
import 'widget/facebook_auth_button.dart';
import 'widget/google_auth_button.dart';
import 'widget/phone_auth_login_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 800,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/welcome.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              height: 800,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
              ),
            ),
             Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50.0, top: 200),
                  child: PhoneAuthLoginButton(),
                ),
                SizedBox(height: 50),
                Text(
                  "welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0, top: 50),
                  child: GoogleAuthLoginButton(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0, top: 20),
                  child: FaceBookAuthLoginButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
