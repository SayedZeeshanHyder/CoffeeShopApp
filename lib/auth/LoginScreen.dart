import 'package:coffeeshop/auth/SignUpScreen.dart';
import 'package:coffeeshop/widgets/mytextfield.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loading_controller.dart';
import '../screens/Home.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loadingController = Get.put(LoadingController());

  var otp;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.coffee,
                    size: width * 0.3,
                  ),
                ),
                Center(
                  child: Text(
                    "Login",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: Colors.brown),
                  ),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                Text(
                  "Email",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Colors.brown),
                ),
                MyTextField(
                  hinttext: "Enter Email",
                  controller: emailController,
                  prefixIcon: const Icon(Icons.email),
                  inputType: TextInputType.emailAddress,
                ),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.brown,
                      ),
                ),
                MyTextField(
                  hinttext: "Enter Password",
                  controller: passwordController,
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  inputType: TextInputType.text,
                  obsuretext: true,
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: height * 0.075,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () async {
                          loadingController.isLoading.value = true;

                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            try {

                              /*await EmailAuth(sessionName: "TestingSession")
                                  .sendOtp(
                                      recipientMail: emailController.text,
                                      otpLength: 5);*/

                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) {
                                loadingController.isLoading.value = false;
                                Get.back();
                                Get.off(() => Home());

                                //Tried to Add the Email Auth but due to lack of time couldnt Complete it . Get.to(() => OtpAuthenticatePage(email:emailController.text));

                                Get.snackbar("Welcome Back !",
                                    "Successfully Logged in as ${emailController.text}");
                              });
                            } catch (e) {
                              loadingController.isLoading.value = false;
                              Get.snackbar("An Error Occured", e.toString());
                            }
                          } else {
                            Get.snackbar(
                                "Error Occured", "Fields Are Left Blank");
                          }
                        },
                        child: loadingController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Login",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => SignUpScreen(),
                            transition: Transition.cupertino);
                      },
                      child: Text(
                        "Dont have a Account?",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.brown),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
