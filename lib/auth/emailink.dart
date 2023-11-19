import 'package:coffeeshop/screens/Home.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpAuthenticatePage extends StatelessWidget{

  final email;
  OtpAuthenticatePage({required this.email});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter OTP"),
            OTPTextField(
              length: 5,
              width: width,
              fieldWidth: width*0.1,
              style: const TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin){
                checkOtp(pin);
              },
            ),
          ],
        ),
      ),
    );
  }

  checkOtp(pin){
    final res = EmailAuth(sessionName: "Testing Session").validateOtp(recipientMail: email, userOtp: pin);
    if(res)
    {
      Get.back();
      Get.off(()=>Home());
    }
    else{
      Get.snackbar("Invalid Otp","Enter Otp is Invalid");
    }
  }

}