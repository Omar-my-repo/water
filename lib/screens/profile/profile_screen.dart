import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/screens/profile/settings_sections/header_info_section.dart';
import 'package:water/screens/profile/settings_sections/rate_us.dart';
import 'package:water/screens/profile/settings_sections/share_app.dart';

import '../../shared/components/custom_list_tile.dart';
import 'settings_sections/about_section.dart';
import 'settings_sections/delivery_policy_section.dart';
import 'settings_sections/language_section.dart';
import 'settings_sections/logout_section.dart';
import 'settings_sections/messages/messages_screen.dart';
import 'settings_sections/style_section.dart';
import 'settings_sections/update_account_info/update_account_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF1EFEF),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderInfoSection(),
              const UpdateAccountInfo(),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(MessagesScreen.routeName);
                },
                child: CustomListTile(
                  title: AppLocalizations.of(context)!.support,
                  leading: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 8),
              const StyleSection(),
              const SizedBox(height: 8),
              const LanguageSection(),
              const SizedBox(height: 8),
              const AboutSection(),
              const SizedBox(height: 8),
              const DeliveryPolicySection(),
              const SizedBox(height: 8),
              const RateUS(),
              const SizedBox(height: 8),
              const ShareApp(),
              const SizedBox(height: 8),
              LogoutSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
