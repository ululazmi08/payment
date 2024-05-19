import 'package:flutter/material.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/typhography.dart';

class LabelDetailProvider extends StatelessWidget {
  const LabelDetailProvider({
    Key? key,
    required this.label,
    required this.value,
    this.style = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kColorNeutral80),
  }) : super(key: key);

  final String label;
  final String value;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style,),
        Text(value, style: style,),
      ],
    );
  }
}
