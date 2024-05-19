import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_payment_app/constant/assets_constant.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/typhography.dart';
import 'package:internet_payment_app/controller/payment_controller.dart';
import 'package:internet_payment_app/page/payment/widget/alert_info.dart';
import 'package:internet_payment_app/page/payment/widget/bottom_nav_bar.dart';
import 'package:internet_payment_app/page/payment/widget/provider_card.dart';
import 'package:internet_payment_app/routes/route_name.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);

  PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorWhite,
        title: const Text('Internet'),
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: kColorWhite,
              child: Column(
                children: [
                  AlertInfo(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose All',
                        style: TStyle.titleBold,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () => controller.toggleSelectAll(),
                          child: controller.selectAll.value
                              ? Image.asset(
                                  AssetsConstant.icCheck,
                                  width: 24,
                                )
                              : Image.asset(
                                  AssetsConstant.icUncheck,
                                  width: 24,
                                ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listProvider.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Obx(
                            () => ProviderCard(
                              data: controller.listProvider[index],
                              dataDetail: controller.listProvider[index].detail,
                              isSelected: controller.selectedItems[index],
                              isDetailVisible: controller.boolSeeDetails[index],
                              onSeeDetailsToggle: () {
                                controller.updateSeeDetails(index);
                              },
                              onItemSelectToggle: () {
                                controller.toggleItemSelection(index);
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: kColorWhite,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(RouteName.history);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('Transaction History', style: TStyle.titleLight,),
                        ),
                        const Icon(Icons.navigate_next_outlined)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavBar(
          total: controller.totalPayment.value,
        ),
      ),
    );
  }
}
