import 'package:get/get.dart';
import 'package:internet_payment_app/page/history/payment_history_page.dart';
import 'package:internet_payment_app/page/payment/payment_page.dart';
import 'package:internet_payment_app/page/detail/payment_detail_transaction.dart';
import 'package:internet_payment_app/routes/route_name.dart';

class PagesRoute {
 static final pages = [
   GetPage(name: RouteName.payment, page: ()=> PaymentPage()),
   GetPage(name: RouteName.history, page: ()=> PaymentHistoryPage()),
   GetPage(name: RouteName.detailTransaction, page: ()=> PaymentDetailTransactionPage()),
 ];
}