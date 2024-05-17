import 'package:flutter/material.dart';
import 'package:smarthome/components/custombuttom.dart';
import 'package:smarthome/components/imagegif.dart';

class ResultCategory extends StatelessWidget {
  const ResultCategory({super.key, required this.title, required this.image});
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ImageGif(image: image),
          const SizedBox(
            height: 15,
          ),
          CustomButtom(title: title, width: 130, hight: 35, blurRadius: 5.0),
        ],
      ),
    );
  }
}
