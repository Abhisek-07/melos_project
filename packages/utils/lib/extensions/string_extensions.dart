extension ExtendedString on String {
  String displayAccountNumber(String accountNumber) {
    if (accountNumber.isEmpty) {
      return "";
    }
    return '*${accountNumber.substring(accountNumber.length - 4)}';
  }

  String addRuppeIcon(String money) {
    return '₹$money.00';
  }

  String truncateUserName(String name) {
    if (name.isEmpty) {
      return '';
    }
    List<String> partnames = name.split(' ');
    if (partnames.length == 1) {
      if (partnames[0].length >= 11) {
        return '${partnames[0].substring(0, 10)}...';
      } else {
        return partnames[0];
      }
    } else {
      String last = '${partnames[partnames.length - 1][0]}.';
      if (partnames[0].length >= 11) {
        return '${partnames[0].substring(0, 10)}.';
      }
      return '${partnames[0]} $last';
    }
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length >= 2) {
      int lastPart = nameParts.length - 1;
      return nameParts[0][0].toUpperCase() +
          nameParts[lastPart][0].toUpperCase();
    } else if (nameParts.length == 1 && nameParts[0].length >= 2) {
      return nameParts[0][0].toUpperCase() + nameParts[0][1].toUpperCase();
    } else if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    } else {
      return '';
    }
  }
}
