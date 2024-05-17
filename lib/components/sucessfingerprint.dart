import 'package:flutter/material.dart';
import 'package:smarthome/helper/constant.dart';

class SucessFingerPrint extends StatelessWidget {
  const SucessFingerPrint({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kprimarycolor,
                blurRadius: 16.0,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: ontap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/images/fingerprint.gif",
                width: 246,
                height: 246,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
