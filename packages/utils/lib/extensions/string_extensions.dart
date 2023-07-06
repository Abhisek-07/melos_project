extension ExtendedString on String {
  String displayAccountNumber(String accountNumber) {
    return '*${accountNumber.substring(accountNumber.length - 4)}';
  }

  String addRuppeIcon(String money) {
    return '₹$money.00';
  }
}
