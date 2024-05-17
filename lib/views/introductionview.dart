import 'package:flutter/material.dart';
import 'package:smarthome/helper/constant.dart';
import 'package:smarthome/components/custombuttom.dart';
import 'package:smarthome/views/fingerprintview.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/introductionscreen.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: kprimarycolor,
                    fontSize: 55,
                    fontFamily: "Ara.Jozoor",
                  ),
                ),
                const Text(
                  "TO",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 55,
                      fontFamily: "Ara.Jozoor"),
                ),
                const Text(
                  "Smart",
                  style: TextStyle(
                      color: kprimarycolor,
                      fontSize: 55,
                      fontFamily: "Ara.Jozoor"),
                ),
                const Text(
                  "Home",
                  style: TextStyle(
                      color: kprimarycolor,
                      fontSize: 55,
                      fontFamily: "Ara.Jozoor"),
                ),
                const Text(
                  "One application for all smart home elements. Live in comfort and security",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Ara.Jozoor"),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/home.gif",
                      width: 173,
                      height: 173,
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomButtom(
                  width: double.infinity,
                  hight: 90,
                  ontap: () {
                    Navigator.pushNamed(context, FingerPrintView.id);
                  },
                  title: "Enter your fingerprint",
                  blurRadius: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
