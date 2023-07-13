import 'dart:convert';

import 'package:component_example/model/bank_account.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void fetchBankAccounts() async {
    // isFetchingBankList = true;
    // notifyListeners();
    banks = await getBankAccounts();
    print(banks);
    getDefaultBankAccount();

    isFetchingBankList = false;
    notifyListeners();
  }

  Future<List<BankAccount>> getBankAccounts() async {
    final jsonData = await rootBundle.loadString('assets/bank_user.json');
    final jsonOptions = json.decode(jsonData);
    List<dynamic> list = jsonOptions['banks'];
    final bankAccounts =
        list.map((bank) => BankAccount.fromJson(bank)).toList();
    // await Future.delayed(const Duration(seconds: 2));

    return bankAccounts;
  }

  void getDefaultBankAccount() {
    defaultAccount = banks.firstWhere((bank) => bank.isDefault);
    isFetchingDefaultAccount = false;
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
}

final banksProvider = ChangeNotifierProvider.autoDispose((ref) {
  return BanksNotifier(ref);
});
