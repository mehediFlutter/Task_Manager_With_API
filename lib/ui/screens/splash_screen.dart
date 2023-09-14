import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_project/ui/data/modiuls/auth_utility.dart';
import 'package:task_manager_project/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager_project/ui/screens/login_screen.dart';
import 'package:task_manager_project/ui/utils/assets_utils.dart';
import 'package:task_manager_project/ui/widgets/screen_background.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigateToLogin();
  }

  Future<void> NavigateToLogin() async {

    Future.delayed(Duration(seconds: 1)).then((_) async {
      final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();

      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isLoggedIn ? BottomNavBaseScreen() : LoginScreen()),
            (route) => false);
      }
      print(isLoggedIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            AssetsUtils.logoSVG,
            fit: BoxFit.scaleDown,
            width: 100,
          ),
        ),
      ),
    );
  }
}
