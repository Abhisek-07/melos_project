// import 'package:bank_user_component/models/bank_account.dart';
// import 'package:bank_user_component/models/user.dart';
// import 'package:bank_user_component/screens/bank_transfer_screen.dart';
// // import 'package:bank_user_component/widgets/custom_elevated_button.dart';
// // import 'package:bank_user_component/widgets/circular_name_icon.dart';
// // import 'package:bank_user_component/widgets/circular_select_button.dart';
// import 'package:bank_user_component/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:component_example/model/bank_account.dart';
import 'package:component_example/model/user.dart';
import 'package:component_example/screens/bank_transfer_screen.dart';
import 'package:components/components.dart';

class UserList extends StatefulWidget {
  const UserList({
    super.key,
    required this.userList,
    required this.banks,
    // required this.selectOption,
    // required this.selectedIndex
  });

  final List<User> userList;
  final List<BankAccount> banks;
  // final void Function(int) selectOption;
  // final int selectedIndex;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  int selectedIndex = -1;

  @override
  void initState() {
    // selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void selectedOption(int index) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return BankTransferScreen(
            user: widget.userList[index], banks: widget.banks);
      },
    ));
    // setState(() {
    //   selectedIndex = index;
    // });
  }

  // void submit() {
  //   /// for customElevatedButton submission
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 1,
                  color: Color.fromARGB(108, 158, 158, 158),
                ),
              );
            },
            itemCount: widget.userList.length,
            itemBuilder: (context, index) {
              User user = widget.userList[index];
              bool isSelected = selectedIndex == index;

              return CustomListTile(
                title: user.name,
                subtitle: '${user.accountNumber} / ${user.ifsc}',
                isSelected: isSelected,
                index: index,
                selectedOption: selectedOption,
                leadingIcon: CircularNameIcon(
                  // size: 'low',
                  name: user.name,
                  backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                ),
                // showTrailing: true,
                // showLeading: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
