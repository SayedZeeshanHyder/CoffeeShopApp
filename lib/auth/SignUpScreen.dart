import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeshop/controllers/loading_controller.dart';
import 'package:coffeeshop/screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/mytextfield.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loadingController = Get.put(LoadingController());

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
                  "SignUp",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.brown),
                )),
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
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Colors.brown),
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

                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) async{

                                await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set({
                                  'email':emailController.text,
                                  "nooforders":0,
                                  "orders":[]
                                });

                            loadingController.isLoading.value = false;
                            Get.back();
                            Get.back();
                            Get.off(() => Home());
                            Get.snackbar("SignUp Successfull","Account Created Successfully",);
                          }).onError((error, stackTrace) {
                            Get.snackbar("An Error Occured", error.toString());
                            loadingController.isLoading.value = false;
                          });
                        },
                        child: loadingController.isLoading.value?const Center(child: CircularProgressIndicator(color: Colors.white,),):Text(
                          "SignUp",
                          style: Theme.of(context).textTheme.displayMedium,
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
                            Get.back();
                          },
                          child: Text(
                            "Already have a Account?",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.brown),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
