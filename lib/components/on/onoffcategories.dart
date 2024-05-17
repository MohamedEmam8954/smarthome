import 'package:flutter/material.dart';
import 'package:smarthome/components/custombuttom.dart';
import 'package:smarthome/components/imagegif.dart';

class OnOffCategories extends StatelessWidget {
  const OnOffCategories(
      {super.key,
      required this.isopened,
      required this.openbuttom,
      required this.closebuttom,
      required this.opentitle,
      required this.closetitle,
      required this.gif,
      required this.nogif});
  final bool isopened;
  final VoidCallback openbuttom;
  final VoidCallback closebuttom;
  final String opentitle;
  final String closetitle;
  final String gif;
  final String nogif;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isopened ? ImageGif(image: gif) : ImageGif(image: nogif),
          const SizedBox(
            height: 20,
          ),
          CustomButtom(
            ontap: openbuttom,
            title: opentitle,
            width: 130,
            hight: 35,
            blurRadius: 5.0,
            isopened: !isopened,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtom(
            blurRadius: 5.0,
            ontap: closebuttom,
            title: closetitle,
            width: 130,
            hight: 35,
            isopened: isopened,
          ),
        ],
      ),
    );
  }
}
