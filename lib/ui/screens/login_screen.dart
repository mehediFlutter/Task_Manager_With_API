import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/data/modiuls/auth_utility.dart';
import 'package:task_manager_project/ui/data/modiuls/login_model.dart';
import 'package:task_manager_project/ui/data/modiuls/network_response.dart';
import 'package:task_manager_project/ui/data/service/network_caller.dart';
import 'package:task_manager_project/ui/data/utils/urls.dart';
import 'package:task_manager_project/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager_project/ui/screens/sign_up_screen.dart';
import 'package:task_manager_project/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _logininProgress = false;

  Future<void> login() async {
    _logininProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "email": _email.text.trim(),
      "password": _password.text,
    };
    final NetworkResponse response =
        await NetworkCaller().postResponse(Urls.login, requestBody);
    _logininProgress = false;
    if (mounted) {
      setState(() {});
    }


    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
    await  AuthUtility.saveUserInfo(model);


      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBaseScreen(),
          ),
          (route) => false);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login Success")));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login Faild!!! Try again")));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Started With",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _email,
                    validator: (String? value) {
                      if(value?.isEmpty??true){
                        return 'Enter Your Email';
                      }
                      return null;

                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _password,
                    validator: (String? value){
                      if(value?.isEmpty??true){
                        return 'Enter Password';

                      }
                      return null;

                    },
                    style: const TextStyle(color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: _logininProgress==false,
                      replacement: Center(child: CircularProgressIndicator(),),
                      child: ElevatedButton(
                        onPressed: () {
                          if(!_formkey.currentState!.validate()){
                            return;
                          }
                          login();

                        },
                        child: const Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()));
                          },
                          child: const Text("Sign up"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
