import 'package:flutter/material.dart';
import 'package:untitled2/core/theme/app_pallete.dart';
import 'package:untitled2/features/auth/presentation/pages/signup_page.dart';
import 'package:untitled2/features/auth/presentation/widgets/auth_field.dart';
import 'package:untitled2/features/auth/presentation/widgets/auth_gradient_button.dart';


class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => LoginPage(),
  );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login', style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(height: 30),
                AuthField(hintText: 'Email', controller: emailController,),
                const SizedBox(height: 15),
                AuthField(hintText: 'Password', controller: passwordController, isObscureText: true,),
                const SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Login',
                  onPressed: () {

                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SignUpPage.route());
                  },
                  child: RichText(text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]
                  ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
