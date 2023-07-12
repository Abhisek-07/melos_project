// import 'dart:developer';

import 'package:component_example/data/banks.dart';
import 'package:component_example/model/bank_account.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BanksNotifier extends ChangeNotifier {
  BanksNotifier(this.ref) : super();
  final Ref ref;

  List<BankAccount> banks = [];
  late BankAccount defaultAccount;
  bool isFetchingBankList = true;
  bool isFetchingDefaultAccount = true;
  List<BankAccount> get bankAccounts => banks;
  BankAccount get defaultBankAccount => defaultAccount;

  void fetchBankAccounts() {
    // isFetchingBankList = true;
    // notifyListeners();
    banks = getBankAccounts();
    isFetchingBankList = false;
    notifyListeners();
  }

  void getDefaultBankAccount() {
    defaultAccount = banks.firstWhere((bank) => bank.isDefault);
    isFetchingDefaultAccount = false;
    notifyListeners();
  }

  void updateDefaultAccount(int tappedIndex) {
    for (int i = 0; i < banks.length; i++) {
      if (i == tappedIndex) {
        banks[i].isDefault = true;
        defaultAccount = banks[i];
      } else {
        banks[i].isDefault = false;
      }
    }
    // log("Notifying...");
    notifyListeners();
  }

  // List<BankAccount> _banks = [];
  // bool isFetchingBankList = false;

  // getDefaultBankAccount() async {
  //   // isFetchingBankList = true;
  //   // notifyListeners();
  //   final banks = ref.read(banksProvider);
  //   final defaultBank = banks((bank) => bank.isDefault);
  //   _banks = defaultBank;
  //   // isFetchingBankList = false;
  //   // notifyListeners();
  // }

  // final List<BankAccount> banks = getBankAccounts();
  // BankAccount? _bankAccount;

  // BanksNotifier(this._ref);

  // BankAccount? get bankAccount => _bankAccount;

  // void changeDefaultBankAccount(BankAccount? bankAccount) {
  //   _bankAccount = bankAccount;
  //   notifyListeners();
  // }
}

final banksProvider = ChangeNotifierProvider((ref) {
  return BanksNotifier(ref);
});
