import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/shared/components/custom_list_tile.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const SizedBox(
                  height: 800,
                );
              });
        },
        child: CustomListTile(
          title: AppLocalizations.of(context)!.about_us,
          leading: Icon(Icons.info),
        ));
  }
}
