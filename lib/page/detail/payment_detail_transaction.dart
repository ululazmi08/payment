import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_payment_app/constant/assets_constant.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/helper.dart';
import 'package:internet_payment_app/constant/typhography.dart';
import 'package:internet_payment_app/controller/payment_controller.dart';
import 'package:internet_payment_app/widget/label.dart';

class PaymentDetailTransactionPage extends StatelessWidget {
  PaymentDetailTransactionPage({Key? key}) : super(key: key);

  PaymentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorWhite,
        title: const Text('Transaction Details'),
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
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                color: kColorWhite,
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        AssetsConstant.icGifSuccess,
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Helper.formatCurrency(
                          (controller.totalPayment.value + 5000),
                        ),
                        style: TStyle.titleBold.copyWith(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Pembayaran Berhasil',
                        style: TStyle.titleLight.copyWith(color: kColorSuccess),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                color: kColorWhite,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedDataDetails.length,
                  itemBuilder: (context, index) {
                    var data = controller.selectedDataDetails[index];
                    return Column(
                      children: [
                        LabelDetailProvider(
                          label: 'Provider',
                          value: data.provider,
                        ),
                        const SizedBox(height: 20),
                        LabelDetailProvider(
                          label: 'ID Pelanggan',
                          value: data.custId,
                        ),
                        const SizedBox(height: 20),
                        LabelDetailProvider(
                          label: 'Paket Layanan',
                          value: data.servicePackage,
                        ),
                        controller.selectedDataDetails[index] ==
                                controller.selectedDataDetails.last
                            ? const SizedBox()
                            : const Divider(
                                height: 40,
                                thickness: 1,
                                color: kColorBackground,
                              ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20,),
                color: kColorWhite,
                child: Column(
                  children: [
                    const LabelDetailProvider(
                      label: 'No. Transaksi',
                      value: 'BC444724669887648110',
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 0,
                      color: kColorBackground,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),
                    const LabelDetailProvider(
                      label: 'Waktu Transaksi',
                      value: '15 Feb 2024 10:32',
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 0,
                      color: kColorBackground,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),
                    LabelDetailProvider(
                      label: 'Jumlah Tagihan',
                      value:
                          Helper.formatCurrency(controller.totalPayment.value),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 0,
                      color: kColorBackground,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),
                    LabelDetailProvider(
                      label: 'Convenience Fee',
                      value: Helper.formatCurrency(5000),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 0,
                      color: kColorBackground,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),
                    const LabelDetailProvider(
                      label: 'Payment Method',
                      value: 'BCA Virtual Account',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Text(
                  'Proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
                  textAlign: TextAlign.center,
                  style: TStyle.desc,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
