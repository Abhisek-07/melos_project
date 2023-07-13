class BankAccount {
  BankAccount(
      {required this.name,
      required this.money,
      required this.accountNumber,
      required this.ifsc,
      required this.icon,
      required this.isDefault});

  final String name;
  final String money;
  final String accountNumber;
  final String ifsc;
  final String icon;
  bool isDefault;

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      name: json['name'],
      money: json['money'],
      accountNumber: json['accountNumber'],
      ifsc: json['ifsc'],
      icon: json['icon'],
      isDefault: json['isDefault'],
    );
  }
}
