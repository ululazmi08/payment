import 'package:flutter/material.dart';
import 'package:internet_payment_app/constant/assets_constant.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/typhography.dart';

class AlertInfo extends StatelessWidget {
  AlertInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kColorBgAlert,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kColorYipyYellow, width: 1),
      ),
      child: Row(
        children: [
          Image.asset(AssetsConstant.icInfo, width: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Perlu diketahui, proses verifikasi transaksi dapat memakan waktu hingga ',
                        style: TStyle.desc.copyWith(
                          fontSize: 12,
                          color: kColorNeutral80,
                        ),
                      ),
                      TextSpan(
                        text: '1x24 jam.',
                        style: TStyle.desc.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                            color: kColorNeutral80,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
