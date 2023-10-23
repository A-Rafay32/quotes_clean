import "package:flutter/material.dart";
import "package:quotes_clean/res/constants.dart";

import "../../widgets/auth_form_field.dart";
import "../../widgets/auth_social_cards.dart";

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(55),
      //   child: LoginAppBar(
      //       press: () => context.go("/${RouterConst.startScreen}"),
      //       title: "Sign In"),
      // ),
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            AuthFormField(
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
            ),
            const SizedBox(
              height: 5,
            ),
            // const Forgot(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
                  backgroundColor: PopupCardColor,
                  elevation: 2.0,
                ),
                onPressed: () {},
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),

            Expanded(child: Container()),
            SocialCard(),
            Container(
              width: w,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // context.go("/${RouterConst.userSignUpScreen}");
                      // context.read<AuthViewModel>().defaultState();
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 17,
                        color: PopupCardColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
