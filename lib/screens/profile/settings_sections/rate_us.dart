import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/shared/components/custom_list_tile.dart';

class RateUS extends StatelessWidget {
  const RateUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CustomListTile(
          title: AppLocalizations.of(context)!.rate_us,
          leading: Icon(Icons.star)),
    );
  }
}
