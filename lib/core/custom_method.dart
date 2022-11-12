import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_pet/core/const.dart';

class CusText extends StatelessWidget {
  String txt;
  Color? color;
  double? size;
  FontWeight? fontWeight;
  CusText(
      {super.key, required this.txt, this.color, this.size, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: poppins.copyWith(
        color: color ?? listColor[new Random().nextInt(listColor.length)],
        fontSize: size ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
