import 'package:coffeeshop/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          //Background
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/login.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: height*0.1,),
                Text("Coffee Day",style: Theme.of(context).textTheme.displayLarge,),
                SizedBox(height: height*0.05,),
                Text("App Contains",style: Theme.of(context).textTheme.displayMedium,),
                SizedBox(height: height*0.03,),
                Text("- List of Drinks",style: Theme.of(context).textTheme.displaySmall,),
                SizedBox(height: height*0.03,),
                Text("- User Authentication",style: Theme.of(context).textTheme.displaySmall,),
                SizedBox(height: height*0.03,),
                Text("- Decent User Interface",style: Theme.of(context).textTheme.displaySmall,),
                SizedBox(height: height*0.03,),
                Text("- Add to Cart Option",style: Theme.of(context).textTheme.displaySmall,),
                SizedBox(height: height*0.06,),
                SizedBox(
                  height: height * 0.075,
                  width: 0.85 * width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>LoginScreen(),transition: Transition.cupertino);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get Started",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: width * 0.075,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
