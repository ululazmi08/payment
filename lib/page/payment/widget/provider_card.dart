import 'package:flutter/material.dart';
import 'package:internet_payment_app/constant/assets_constant.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/constant/helper.dart';
import 'package:internet_payment_app/constant/typhography.dart';
import 'package:internet_payment_app/models/provider_model.dart';
import 'package:internet_payment_app/widget/label.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({
    required this.data,
    required this.dataDetail,
    required this.isSelected,
    required this.isDetailVisible,
    required this.onSeeDetailsToggle,
    required this.onItemSelectToggle,
    Key? key,
  }) : super(key: key);

  final ProviderModel data;
  final Detail dataDetail;
  final bool isSelected;
  final bool isDetailVisible;
  final VoidCallback onSeeDetailsToggle;
  final VoidCallback onItemSelectToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kColorMainLine, width: 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
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
                        Helper.formatCurrency(data.price), style: TStyle.title,
                      ),
                      const SizedBox(height: 4),
                      Text(data.time, style: TStyle.desc,),
                    ],
                  ),
                ),
                InkWell(
                  onTap: onItemSelectToggle,
                  child: isSelected
                      ? Image.asset(
                          AssetsConstant.icCheck,
                          width: 24,
                        )
                      : Image.asset(
                          AssetsConstant.icUncheck,
                          width: 24,
                        ),
                ),
              ],
            ),
          ),
          if (isDetailVisible)
            Column(
              children: [
                const Divider(
                  color: kColorMainLine,
                  height: 0,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      LabelDetailProvider(
                        label: 'Provider',
                        style: TStyle.desc.copyWith(
                          fontSize: 12,
                          color: kColorNeutral80,
                        ),
                        value: dataDetail.provider,
                      ),
                      const SizedBox(height: 10),
                      LabelDetailProvider(
                        label: 'ID Pelanggan',
                        style: TStyle.desc.copyWith(
                          fontSize: 12,
                          color: kColorNeutral80,
                        ),
                        value: dataDetail.custId,
                      ),
                      const SizedBox(height: 10),
                      LabelDetailProvider(
                        label: 'Paket Layanan',
                        style: TStyle.desc.copyWith(
                          fontSize: 12,
                          color: kColorNeutral80,
                        ),
                        value: dataDetail.servicePackage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          const Divider(
            color: kColorMainLine,
            thickness: 1,
            height: 0,
          ),
          const SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: onSeeDetailsToggle,
              child: Text(
                isDetailVisible ? 'Closed' : 'See Details',
                style: TStyle.desc.copyWith(color: kColorYipyRed),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
