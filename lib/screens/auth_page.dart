import 'package:flutter/material.dart';
import 'package:mencoba_1/components/login_form.dart';
import 'package:mencoba_1/components/sign_up_form.dart';
import 'package:mencoba_1/components/social_button.dart';
import 'package:mencoba_1/utils/config.dart';
import 'package:mencoba_1/utils/text.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppText.enText['welcome_text']!,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),

              Text(
                isSignIn
                    ? AppText.enText['signIn_text']!
                    : AppText.enText['register_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,

              isSignIn ? LoginForm() : SignUpForm(),
              Config.spaceSmall,

              isSignIn
                  ? Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppText.enText['forgot-password']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                  : Container(),

              const Spacer(),
              Center(
                child: Text(
                  AppText.enText['social-login']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: const <Widget>[
                  SocialButton(social: 'facebook'),
                  SocialButton(social: 'google'),
                  SocialButton(social: 'x'),
                  // kalo mau tambahin socmed apalagi bisa tapi mesti masukkin logo nya juga
                ],
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    isSignIn
                        ? AppText.enText['signUp_text']!
                        : AppText.enText['registered_text']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        isSignIn = !isSignIn;
                      });
                    },
                    child: Text(
                      isSignIn ? 'SignUp' : 'Sign In',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
