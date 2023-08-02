
import 'package:devoper/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _handleBtnClick() {
    _signInWithGoogle().then((user){
      print("user: ${user.user}");
        Get.to(() => const HomeScreen(), transition: Transition.noTransition);});
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //Obtain the auth details from user.
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    //Create a new credentials
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //once signed in return the user credentials
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/AppIcon.svg',
            width: mq.height * 0.2,
          ),
          16.heightBox,
          const Center(
            child: Text(
              'Welcome back to Devoper!',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          24.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: OutlinedButton(
                onPressed: () {
                  _handleBtnClick();
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 16,
                    ),
                    12.widthBox,
                    const Text(
                      'CONTINUE WITH GOOGLE',
                      style: TextStyle(letterSpacing: -0.4),
                    ),
                  ],
                )),
          ),
          8.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/apple.png',
                      width: 16,
                    ),
                    12.widthBox,
                    const Text(
                      'CONTINUE WITH APPLE   ',
                      style: TextStyle(letterSpacing: -0.4),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
