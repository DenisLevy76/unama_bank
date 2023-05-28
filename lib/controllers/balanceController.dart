import 'package:get/get.dart';

class Transaction {
  String title;
  String pix;
  double amount;

  Transaction({required this.title, required this.amount, required this.pix});
}

class BalanceController extends GetxController {
  RxDouble balance = 0.00.obs;
  List<Transaction> transactions = <Transaction>[].obs;
}
