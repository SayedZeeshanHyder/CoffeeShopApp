import 'package:coffeeshop/splash/SplashService.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashService service = SplashService();

  @override
  void initState() {
    super.initState();
    service.splash();
  }

  @override
  Widget build(BuildContext context) {

    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
                height: height*0.3,
                child: Lottie.asset("assets/lottie/splashlottie.json"),
            ),
            Text("Coffee Day",style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.brown),),
          ],
        ),
      ),
    );
  }
}