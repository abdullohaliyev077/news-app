import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/HomePageController.dart';


import 'package:lottie/lottie.dart';
 

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void nextPage() {
    Future.delayed(Duration(seconds: 7), () {              
      Future.delayed(Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageController(),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: LottieBuilder.asset(
                  "Assets/Animation/news.json",
                  fit: BoxFit.contain,
                  repeat: false,
                  animate: true,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 500),
              child: Center(
                child: Visibility(
                  visible:true,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
