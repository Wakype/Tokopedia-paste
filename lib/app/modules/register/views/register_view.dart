// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final controller = Get.put(RegisterController());
  final authController = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 70, 25, 40),
                child: Column(
                  children: [
                    Container(
                      height: tinggi * 0.8,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () => Get.toNamed(Routes.LOGIN),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 12),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: IntrinsicWidth(
                                    child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                ))),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: IntrinsicWidth(
                                    child: Text(
                                        'Connect with your favorite store today!',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: abuAbu)))),
                          ),
                          CustomInput(
                            controller: controller.email,
                              label: 'Email Address',
                              hint: 'Enter your email address',
                              keyboardType: TextInputType.emailAddress,
                              obscure: false),
                          SizedBox(
                            height: 20,
                          ),
                          PhoneInput(),
                          SizedBox(
                            height: 20,
                          ),
                          CustomInput(
                            controller: controller.password,
                            label: 'Password',
                            hint: 'Enter your password',
                            keyboardType: TextInputType.visiblePassword,
                            obscure: controller.visibilityPassword.value
                                ? false
                                : true,
                            icon: IconButton(
                                onPressed: () => controller.changeEye(),
                                icon: Icon(controller.visibilityPassword.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () => authController.registeer(controller.email.text, controller.password.text),
                              child: Container(
                                width: lebar,
                                height: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: bgLogin2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: lebar * 0.27,
                                  height: 1,
                                  color: abuAbu,
                                ),
                                Container(
                                  child: Text(
                                    'Or Sign Up with',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: abuAbu),
                                  ),
                                ),
                                Container(
                                  width: lebar * 0.27,
                                  height: 1,
                                  color: abuAbu,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SocialMediaButton(
                                    text: 'Facebook',
                                    image: 'assets/images/Facebook.png',
                                    context: context),
                                SocialMediaButton(
                                    text: 'Google',
                                    image: 'assets/images/Google.png',
                                    context: context),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: 90),
                      width: lebar,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: Text(
                              'Already have an account?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: abuAbu),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () => Get.toNamed(Routes.LOGIN),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: bgLogin2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

Widget CustomInput({label, controller, obscure, hint, icon, keyboardType}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscure,
            decoration: InputDecoration(
              // labelText: customLabel,
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 19,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: abuAbu,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: abuAbu, width: 1),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 27, 27, 27), width: 1),
                gapPadding: 5,
              ),
              // filled: true,
            )),
      ),
    ],
  );
}

Widget SocialMediaButton({text, image, required BuildContext context}) {
  double tinggi = MediaQuery.of(context).size.height;
  double lebar = MediaQuery.of(context).size.width;
  return InkWell(
    child: Container(
      width: lebar * 0.4,
      height: 55,
      decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1, color: abuAbu)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            width: 30,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          Container(
            child: Text(text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    ),
  );
}

Widget PhoneInput() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Phone Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: abuAbu)),
        child: Stack(
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                // print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                // print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              // textFieldController: controller,
              formatInput: false,
              maxLength: 12,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              cursorColor: Colors.black,
              inputDecoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 19,
                ),
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    color: abuAbu,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                border: InputBorder.none,
              ),
              // onSaved: (PhoneNumber number) {
              //   print('On Saved: $number');
              // },
            ),
            Positioned(
              left: 90,
              top: 8,
              bottom: 8,
              child: Container(
                height: 40,
                width: 1,
                color: Colors.black.withOpacity(0.13),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
