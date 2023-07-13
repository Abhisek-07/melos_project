import 'package:component_example/providers/selected_user_provider.dart';
import 'package:component_example/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:component_example/model/user.dart';
import 'package:components/components.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils/utils.dart';

class UserList extends HookConsumerWidget {
  const UserList({
    super.key,
  });

  final int selectedIndex = -1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserNotifier userNotifier = ref.watch(usersProvider);

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
            itemCount: userNotifier.users.length,
            itemBuilder: (context, index) {
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
                  context.pushNamed('bank transfer');
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                leadingIcon: CircularNameIcon(
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
