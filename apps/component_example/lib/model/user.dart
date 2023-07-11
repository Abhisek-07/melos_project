class User {
  User(
      {required this.id,
      required this.name,
      required this.accountNumber,
      required this.ifsc});

  final String id;
  final String name;
  final String accountNumber;
  final String ifsc;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      accountNumber: json['accountNumber'],
      ifsc: json['ifsc'],
    );
  }

  factory User.empty() {
    return User(
      id: '',
      name: '',
      accountNumber: '',
      ifsc: '',
    );
  }
}
