import 'package:component_example/data/banks.dart';
import 'package:component_example/model/bank_account.dart';
import 'package:component_example/model/user.dart';
import 'package:component_example/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BanksNotifier extends ChangeNotifier {
  final Ref _ref;

  List<BankAccount> _banks = [];
  bool isFetchingBankList = false;

  getDefaultBankAccount() async {
    isFetchingBankList = true;
    notifyListeners();
    final banks = ref.read(banksProvider);
    final defaultBank = banks((bank) => bank.isDefault);
    _banks = defaultBank;
    isFetchingBankList = false;
    notifyListeners();
  }

  final List<BankAccount> banks = getBankAccounts();
  BankAccount? _bankAccount;

  BanksNotifier(this._ref);

  BankAccount? get bankAccount => _bankAccount;

  void changeDefaultBankAccount(BankAccount? bankAccount) {
    _bankAccount = bankAccount;
    notifyListeners();
  }
}

final banksProvider = ChangeNotifierProvider((ref) {
  return BanksNotifier(ref);
});
