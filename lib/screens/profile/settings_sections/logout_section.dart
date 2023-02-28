import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../login/login_screen.dart';

class LogoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
      },
      child: Container(
        color: Colors.redAccent,
        child: ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.logout,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white),
              ),
              //  const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
