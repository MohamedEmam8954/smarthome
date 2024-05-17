import 'package:flutter/material.dart';
import 'package:smarthome/helper/constant.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      this.ontap,
      required this.title,
      required this.width,
      required this.hight,
      required this.blurRadius,
      this.isopened = false});
  final VoidCallback? ontap;
  final String title;
  final double width;
  final double hight;
  final double blurRadius;
  final bool isopened;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: hight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(80),
          boxShadow: [
            BoxShadow(
              color: kprimarycolor,
              blurRadius: blurRadius,
            ),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isopened ? Colors.black : kprimarycolor,
              fontSize: 24,
              fontFamily: "Ara.Jozoor"),
        ),
      ),
    );
  }
}
