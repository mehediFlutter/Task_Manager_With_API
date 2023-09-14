import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/screens/otp_verification_screen.dart';
import 'package:task_manager_project/ui/widgets/screen_background.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Email Address",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "A 6 digits verification pin will send to your email address",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpVerificationScreen()),
                        (route) => false);
                  },
                  child: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
