import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smarthome/helper/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.ontap, required this.title});
  final VoidCallback ontap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: kprimarycolor,
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: kprimarycolor,
                size: 30,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: kprimarycolor,
              fontSize: 45,
              fontFamily: "Ara.Jozoor",
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
