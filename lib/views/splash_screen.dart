import 'package:devoper/utils/colors.dart';
import 'package:devoper/views/auth/login_screen.dart';
import 'package:devoper/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Get.to(()=> const LoginScreen(), transition: Transition.noTransition);
    });
  }
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/icons/illustration2.svg', width: MediaQuery.of(context).size.width*0.6,),
            ),
            // const Spacer(),
            SvgPicture.asset(
              'assets/icons/AppIcon.svg',
              width: mq.height * 0.2,
            ),
            16.heightBox,
            const Center(
              child: Text(
                'Developer\'s Operation',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            20.heightBox,
            const CircularProgressIndicator(
              color: darkColor,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset('assets/icons/illustration1.svg', width: MediaQuery.of(context).size.width*0.6,)),
          ],
        ),
      ),
    );
  }
}
