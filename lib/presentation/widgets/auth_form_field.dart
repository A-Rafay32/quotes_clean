import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import 'package:quotes_clean/res/constants.dart';

class AuthFormField extends StatefulWidget {
  AuthFormField({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool isObscure = false;
  // final formKey = GlobalKey<FormState>();

  void setObscureText() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      // key: Provider.of<login>(context, listen: false).formKey,
      child: Container(
        // height: size.height * 0.31,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? "Enter a valid email "
                      : null;
                },
                controller: widget.emailController,
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: EmailInputDecoration("email")),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                return value != null && value.length < 6
                    ? "Enter min 6 characters "
                    : null;
              },
              obscureText: isObscure,
              controller: widget.passwordController,
              cursorColor: Colors.black,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: PasswordInputDecoration(isObscure, setObscureText),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration EmailInputDecoration(String label) {
  return InputDecoration(
      suffixIcon: (label == "email")
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Icon(
                Icons.email_outlined,
                color: PopupCardColor,
              ),
            )
          : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      labelText: label,
      labelStyle: const TextStyle(color: PopupCardColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "Enter your ${label.toLowerCase()}",
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kbackgroundColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kbackgroundColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10));
}

InputDecoration PasswordInputDecoration(bool isObscure, VoidCallback press) {
  return InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: IconButton(
          onPressed: press,
          icon: (isObscure)
              ? SvgPicture.asset("assets/icons/eye_closed.svg",
                  height: 30,
                  width: 30,
                  colorFilter:
                      ColorFilter.mode(Colors.green.shade800, BlendMode.srcIn))
              : SvgPicture.asset("assets/icons/eye_open.svg",
                  height: 30,
                  width: 30,
                  colorFilter:
                      ColorFilter.mode(Colors.green.shade800, BlendMode.srcIn)),
          iconSize: 28,
          color: PopupCardColor,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      labelText: "Password",
      labelStyle: const TextStyle(color: PopupCardColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "Enter your password",
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kbackgroundColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kbackgroundColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10));
}
