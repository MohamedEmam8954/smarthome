import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smarthome/helper/constant.dart';

class ImageGif extends StatelessWidget {
  const ImageGif({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: kprimarycolor,
            blurRadius: 8.0,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
