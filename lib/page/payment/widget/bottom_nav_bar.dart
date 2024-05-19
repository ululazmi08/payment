import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_payment_app/constant/assets_constant.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/helper.dart';
import 'package:internet_payment_app/constant/typhography.dart';
import 'package:internet_payment_app/routes/route_name.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.total,
  }) : super(key: key);

  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
          decoration: BoxDecoration(
            color: kColorWhite,
            boxShadow: [
              BoxShadow(
                color: kColorNeutral10.withOpacity(0.1),
                offset: const Offset(0, 0.5),
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetsConstant.icBill,
                    width: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Total Payment',
                      style: TStyle.titleBold,
                    ),
                  ),
                  Text(
                    Helper.formatCurrency(total).toString(),
                    style: TStyle.titleBold.copyWith(color: kColorYipyBlue),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: kColorYipyRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.detailTransaction);
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PAY NOW',
                              style: TStyle.buttonCaption,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
