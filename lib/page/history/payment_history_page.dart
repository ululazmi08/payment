import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/typhography.dart';
import 'package:internet_payment_app/controller/payment_controller.dart';
import 'package:internet_payment_app/page/history/widget/history_card.dart';

class PaymentHistoryPage extends StatelessWidget {
  PaymentHistoryPage({Key? key}) : super(key: key);

  PaymentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorWhite,
        title: const Text('Transaction History'),
        centerTitle: true,
        elevation: 1.5,
        titleTextStyle: TStyle.titleBold,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: kColorNeutral80,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          color: kColorWhite,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listHistory.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  HistoryCard(
                    data: controller.listHistory[index],
                  ),
                  controller.listHistory[index] == controller.listHistory.last
                      ? const SizedBox()
                      : const Divider(
                          height: 0,
                          thickness: 1,
                          color: kColorMainLine,
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
