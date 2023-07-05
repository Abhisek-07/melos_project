extension ExtendedString on String {
  String displayAccountNumber(String accountNumber) {
    return '*${accountNumber.substring(accountNumber.length - 4)}';
  }
}
