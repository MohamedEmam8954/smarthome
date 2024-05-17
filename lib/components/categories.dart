import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';
import 'package:smarthome/helper/constant.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, this.ontap, required this.image, this.title});
  final VoidCallback? ontap;
  final String image;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MqttCubit(),
      child: GestureDetector(
        onTap: ontap,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 5, top: 15, bottom: 10),
          child: Container(
            width: 154,
            height: 189,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: kprimarycolor,
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  image,
                ),
                image != "assets/images/livingroom (4).svg"
                    ? const Divider(
                        color: Colors.black,
                        indent: 30,
                        endIndent: 30,
                        thickness: 3,
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title == null ? "" : title!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: fontfamily,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
