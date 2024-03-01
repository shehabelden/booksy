import 'package:flutter/material.dart';

class PhoneAuthLoginButton extends StatelessWidget {
  const PhoneAuthLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(.3),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: const Text("continue with phone number",
          style: TextStyle(color: Colors.white)),
    );
  }
}
