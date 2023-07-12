// import 'package:bank_user_component/models/bank_account.dart';
// import 'package:bank_user_component/models/user.dart';
// import 'package:bank_user_component/screens/bank_transfer_screen.dart';
// // import 'package:bank_user_component/widgets/custom_elevated_button.dart';
// // import 'package:bank_user_component/widgets/circular_name_icon.dart';
// // import 'package:bank_user_component/widgets/circular_select_button.dart';
// import 'package:bank_user_component/widgets/custom_list_tile.dart';
import 'package:component_example/providers/selected_user_provider.dart';
import 'package:component_example/providers/users_provider.dart';
import 'package:flutter/material.dart';
// import 'package:component_example/model/bank_account.dart';
import 'package:component_example/model/user.dart';
import 'package:component_example/screens/bank_transfer_screen.dart';
import 'package:components/components.dart';
// import 'package:go_router/go_router.dart';
import 'package:utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({
    super.key,
    // required this.userList,
    // required this.banks,
  });

  // final List<User> userList;
  // final List<BankAccount> banks;

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  void selectedOption() {
    // context.pushNamed('bank transfer',);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const BankTransferScreen(
            // selectedUser: user,
            // banks: widget.banks,
            );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = ref.watch(usersProvider);
    // User selectedUser = ref.watch(selectedUserProvider);

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
            // itemCount: widget.userList.length,
            itemCount: userNotifier.users.length,
            itemBuilder: (context, index) {
              // User user = widget.userList[index];
              User user = userNotifier.users[index];
              bool isSelected = selectedIndex == index;

              return CustomListTile(
                title: user.name,
                subtitle: '${user.accountNumber} / ${user.ifsc}',
                isSelected: isSelected,
                index: index,
                onTap: () {
                  ref
                      .read(selectedUserProvider.notifier)
                      .updateUser(userNotifier.users[index]);
                  selectedOption();
                  // .updateUser(widget.userList[index]);
                  // selectedOption(ref.read(selectedUserProvider));
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                leadingIcon: CircularNameIcon(
                  // index: index,
                  linearGradientColors:
                      index % gradientColorsForNameIcon.length == 0
                          ? gradientColorsForNameIcon[0]
                          : gradientColorsForNameIcon[1],
                  name: user.name,
                  size: IconSize.medium,
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
