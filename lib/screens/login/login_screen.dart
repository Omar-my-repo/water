import 'package:flutter/material.dart';
import 'package:water/screens/register/register_screen.dart';
import 'package:water/shared/components/custom_text_field.dart';
import 'package:water/shared/components/main_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  // @override
  // void initState() {
  //   //مهم
  //   super.initState();
  //   viewModel.navigator = this;
  //   FlutterNativeSplash.remove();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 80),
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter valid Email';
                      }
                      return null;
                    },
                    hint: 'Enter your Email',
                    label: 'Email',
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ' Please enter your password';
                      }
                      return null;
                    },
                    hint: 'Enter your Password',
                    label: 'Password',
                    obscureText: isObscure,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye)),
                  ),
                  const SizedBox(height: 18),
                  // const Text(
                  //   'Forget your password?',
                  //   textAlign: TextAlign.right,
                  // ),
                  const SizedBox(height: 32),
                  MainButton(
                    onTap: () {},
                    text: 'Login',
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ? '),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: const Text(
                            'Register now!',
                            style: TextStyle(
                                fontSize: 16, color: Colors.blueAccent),
                          )),
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
