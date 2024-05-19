import 'package:flutter/material.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/helper.dart';
import 'package:internet_payment_app/constant/typhography.dart';
import 'package:internet_payment_app/models/history_model.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.data}) : super(key: key);

  final HistoryModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: kColorMainLine,
                width: 0.5,
              ),
              image: DecorationImage(
                image: AssetImage(data.image),
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.provider,
                  style: TStyle.titleLight,
                ),
                const SizedBox(height: 4),
                Text(
                  data.time,
                  style: TStyle.desc,
                ),
              ],
            ),
          ),
          Text(
            Helper.formatCurrency(data.price),
            style: TStyle.title,
          ),
        ],
      ),
    );
  }
}
