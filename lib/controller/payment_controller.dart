import 'package:get/get.dart';
import 'package:internet_payment_app/constant/assets_constant.dart';
import 'package:internet_payment_app/models/history_model.dart';
import 'package:internet_payment_app/models/provider_model.dart';

class PaymentController extends GetxController {
  var listProvider = <ProviderModel>[
    ProviderModel(
      price: 450000,
      time: 'Due date on 16 Feb 2024',
      image: AssetsConstant.imgNethome,
      detail: Detail(
        provider: 'Nethome',
        custId: '1123645718921',
        servicePackage: 'Nethome 100 Mbps',
      ),
    ),
    ProviderModel(
      price: 240000,
      time: 'Due date on 20 Feb 2024',
      image: AssetsConstant.imgBiznet,
      detail: Detail(
        provider: 'Bizzcom',
        custId: '1123645718921',
        servicePackage: 'Nethome 100 Mbps',
      ),
    ),
  ];

  var listHistory = <HistoryModel>[
    HistoryModel(
      price: 445000,
      time: '15 Feb 2024 10:32',
      image: AssetsConstant.imgNethome,
      provider: 'Nethome',
    ),
    HistoryModel(
      price: 245000,
      time: '14 Feb 2024 16:12',
      image: AssetsConstant.imgBiznet,
      provider: 'Bizzcom',
    ),
    HistoryModel(
      price: 245000,
      time: '16 Jan 2024 11:21',
      image: AssetsConstant.imgBiznet,
      provider: 'Bizzcom',
    ),
    HistoryModel(
      price: 445000,
      time: '13 Jan 2024 09:25',
      image: AssetsConstant.imgNethome,
      provider: 'Nethome',
    ),
    HistoryModel(
      price: 245000,
      time: '14 Dec 2024 17:45',
      image: AssetsConstant.imgBiznet,
      provider: 'Bizzcom',
    ),
  ];

  var selectedDataDetails = <Detail>[].obs;

  var boolSeeDetails = <bool>[].obs;
  var selectedItems = <bool>[].obs;
  var selectAll = false.obs;
  var totalPayment = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    boolSeeDetails.assignAll(List<bool>.filled(listProvider.length, false));
    selectedItems.assignAll(List<bool>.filled(listProvider.length, false));
    calculateTotalPayment();
  }

  void updateSeeDetails(int index) {
    boolSeeDetails[index] = !boolSeeDetails[index];
    boolSeeDetails.refresh();
  }

  void toggleItemSelection(int index) {
    selectedItems[index] = !selectedItems[index];
    if (selectedItems[index]) {
      selectedDataDetails.add(listProvider[index].detail);
    } else {
      selectedDataDetails.remove(listProvider[index].detail);
    }
    updateSelectAllStatus();
    calculateTotalPayment();
    selectedItems.refresh();
  }

  void toggleSelectAll() {
    selectAll.value = !selectAll.value;
    if (selectAll.value) {
      selectedItems.assignAll(List<bool>.filled(listProvider.length, true));
      selectedDataDetails
          .assignAll(listProvider.map((item) => item.detail).toList());
    } else {
      selectedItems.assignAll(List<bool>.filled(listProvider.length, false));
      selectedDataDetails.clear();
    }
    calculateTotalPayment();
  }

  void updateSelectAllStatus() {
    selectAll.value = selectedItems.every((selected) => selected);
  }

  void calculateTotalPayment() {
    totalPayment.value = 0;
    for (int i = 0; i < listProvider.length; i++) {
      if (selectedItems[i]) {
        totalPayment.value += listProvider[i].price;
      }
    }
  }
}
