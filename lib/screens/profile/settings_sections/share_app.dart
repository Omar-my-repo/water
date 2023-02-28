import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/shared/components/custom_list_tile.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CustomListTile(
          title: AppLocalizations.of(context)!.share,
          leading: Icon(Icons.share)),
    );
  }
}
